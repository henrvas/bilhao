class EducationalInstitute < ApplicationRecord
  has_many :enrolloments

  validates :name, presence: true, uniqueness: true
  validates :cnpj, presence: true, uniqueness: true, length: { is: 14 }
  validates :school_type, presence: true, inclusion: { in: ['university', 'school', 'kindergarten'],
    message: "%{value} não é um school type válido" }
  validates :status_educational_institute, presence: true, inclusion: { in: ['ativo', 'inativo'] }
  normalize :cnpj, with: -> cnpj {cnpj.strip.upcase.gsub(/[^0-9]/, '')}
  normalize :school_type, with: -> school_type {school_type.strip.downcase}
  normalize :name, with: -> name {name.strip.downcase}
  normalize :status_educational_institute, with: -> status_educational_institute {status_educational_institute.strip.downcase}
end

