class Student < ApplicationRecord
  has_many :enrolloments
  has_many :educational_institutes, through: :enrolloments

  validates :name, presence: true, uniqueness: true
  validates :cpf, presence: true, uniqueness: true
  validate :cpf_validate

  validates :date_of_birth, presence: true
  validates :cell_number, presence: true, uniqueness: true, numericality: { only_integer: true }
  validates :gender, presence: true, inclusion: { in: ['male', 'female', 'other'],
    message: "%{value} não é um gender válido" }
  validates :method_of_payment, presence: true, inclusion: { in: ['credit_card', 'debit_card', 'pix', 'boleto'],
    message: "%{value} não é um method_of_payment válido" }
  validates :status, presence: true, inclusion: { in: ['ativo', 'inativo'] }
  validates :highest_completed_level, inclusion: { in: EducationalInstitute::SCHOOL_TYPES }, allow_nil: true
  normalizes :method_of_payment, with: -> method_of_payment {method_of_payment.strip.downcase}
  normalizes :gender, with: -> gender {gender.strip.downcase}
  normalizes :cpf, with: -> cpf {cpf.strip.downcase.gsub(/[^0-9]/, '')}
  normalizes :name, with: -> name {name.strip.downcase}
  normalizes :status, with: -> status {status.strip.downcase}
  normalizes :highest_completed_level, with: -> level {level&.strip&.downcase}

  validate :imudavel, on: :update

  private

  def imudavel
    if cpf_changed?
      errors.add(:cpf, "não pode ser alterado")
    end
  end

  def cpf_validate
    errors.add(:cpf, "não é um CPF válido") if cpf.present? && !CPF.valid?(cpf)
  end
end


