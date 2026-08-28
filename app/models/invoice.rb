class Invoice < ApplicationRecord
  include AASM

  # taxa de juros ao dia aplicada sobre fatura vencida e não paga
  JUROS_DIARIO = 0.01.to_d

  belongs_to :enrolloment

  validates :price_invoice, presence: true, numericality: true
  validates :invoice_status, presence: true, inclusion: { in: ['aberta', 'paga', 'vencida'] }
  validates :invoice_due_date, presence: true

  validate :imudavel, on: :update

  after_find :verificar_atraso

  aasm column: :invoice_status do
    state :aberta, initial: true
    state :paga
    state :vencida

    event :pagar do
      transitions from: [:aberta, :vencida], to: :paga
    end

    event :vencer do
      transitions from: :aberta, to: :vencida
    end
  end

  def confirmar_pagamento!
    transitioned = pagar!
    update_column(:paid_at, Time.current) if transitioned && paid_at.blank?
    transitioned
  end

  def imudavel
    if price_invoice_changed?
      errors.add(:price_invoice, "não pode ser alterado")
    end
    if enrolloment_id_changed?
      errors.add(:enrolloment_id, "não pode ser alterado")
    end
  end

  private

  # Nao tem um job rodando para verificar atrasos,
  # so vai começar a contar juros quando o atualizar o status da fatura ou quando a fatura for carregada do banco de dados
  def verificar_atraso
    return if paid_at.present?
    return unless invoice_due_date

    if invoice_status == 'aberta' && invoice_due_date < Date.current
      self.invoice_status = 'vencida'
    end

    return unless invoice_status == 'vencida'

    dias_em_atraso = (Date.current - invoice_due_date).to_i
    juros_calculado = (price_invoice * JUROS_DIARIO * dias_em_atraso).round(2)

    if invoice_status_changed? || juros_calculado != juros
      self.juros = juros_calculado
      update_columns(invoice_status: invoice_status, juros: juros)
    end
  end
end
