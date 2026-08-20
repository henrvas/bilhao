class Student < ApplicationRecord
  has_many :enrolloments
  has_many :educational_institutes, through: :enrolloments

  validates :name, presence: true, uniqueness: true
  validates :cpf, presence: true, uniqueness: true, numericality: { only_integer: true }, length: { is: 11 }
    
  validates :date_of_birth, presence: true
  validates :cell_number, presence: true, uniqueness: true, numericality: { only_integer: true }
  validates :gender, presence: true, inclusion: { in: ['male', 'female', 'other'],
    message: "%{value} não é um gender válido" }
  validates :method_of_payment, presence: true, inclusion: { in: ['credit_card', 'debit_card', 'pix', 'boleto'],
    message: "%{value} não é um method_of_payment válido" }
  normalizes :method_of_payment, with: -> method_of_payment {method_of_payment.strip.downcase}
  normalizes :gender, with: -> gender {gender.strip.downcase}
  normalizes :cpf, with: -> cpf {cpf.strip.downcase.gsub(/[^0-9]/, '')}
  normalizes :name, with: -> name {name.strip.downcase}

  def imudavel
    if cpf_changed?
      errors.add(:cpf, "não pode ser alterado")
    end
  end
end


