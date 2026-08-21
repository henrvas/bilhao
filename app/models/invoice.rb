class Invoice < ApplicationRecord
  belongs_to :enrolloment

  validates :price_invoice, presence: true, numericality: true
  validates :invoice_status, presence: true, inclusion: { in: ['aberta'] }
  validates :invoice_due_date, presence: true

  def imudavel
    if price_invoice_changed?
      errors.add(:price_invoice, "não pode ser alterado")
    end
    if invoice_due_date_changed?
      errors.add(:invoice_due_date, "não pode ser alterado")
    end
    if enrolloment_id_changed?
      errors.add(:enrolloment_id, "não pode ser alterado")
    end
  end
end


