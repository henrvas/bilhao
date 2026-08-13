class Student < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :cpf, presence: true, uniqueness: true, numericality: { only_integer: true }, length: { is: 11 }
    
  validates :date_of_birth, presence: true
  validates :cell_number, presence: true, uniqueness: true, numericality: { only_integer: true }, length: { is: 11 }
  validates :gender, presence: true, inclusion: { in: ['male', 'female', 'other'],
    message: "%{value} não é um gender válido" }
  validates :method_of_payment, presence: true, inclusion: { in: ['credit_card', 'debit_card', 'pix', 'boleto'],
    message: "%{value} não é um method_of_payment válido" }
  normalize :method_of_payment, with: -> method_of_payment {method_of_payment.strip.downcase}
  normalize :gender, with: -> gender {gender.strip.downcase}
  normalize :cpf, with: -> cpf {cpf.strip.downcase.gsub(/[^0-9]/, '')}
  normalize :name, with: -> name {name.strip.downcase}
end
