class EducationalInstitute < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :cnpj, presence: true, uniqueness: true, length: { is: 14 }
  validates :school_type, presence: true, inclusion: { in: ['university', 'school', 'kindergarten'],
    message: "%{value} não é um school type válido" }
  normalize :cnpj, with: -> cnpj {cnpj.strip.upcase.gsub(/[^0-9]/, '')}
  normalize :school_type, with: -> school_type {school_type.strip.downcase}
end
