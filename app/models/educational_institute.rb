class EducationalInstitute < ApplicationRecord
  has_many :enrolloments
  has_many :students, through: :enrolloments

  validates :name, presence: true, uniqueness: true
  validates :cnpj, presence: true, uniqueness: true
  validate :cnpj_validate
  validates :school_type, presence: true, inclusion: { in: ['university', 'school', 'kindergarten'],
    message: "%{value} não é um school type válido" }
  validates :status_educational_institute, presence: true, inclusion: { in: ['ativo', 'inativo'] }
  normalizes :cnpj, with: -> cnpj {cnpj.strip.upcase.gsub(/[^0-9]/, '')}
  normalizes :school_type, with: -> school_type {school_type.strip.downcase}
  normalizes :name, with: -> name {name.strip.downcase}
  normalizes :status_educational_institute, with: -> status_educational_institute {status_educational_institute.strip.downcase}

  private
  
  def imudavel
    if cnpj_chaged?
      errors.add(:cnpj, "não pode ser alterado")
    end
  end

  private

  def cnpj_validate
    errors.add(:cnpj, "não é um CNPJ válido") if cnpj.present? && !CNPJ.valid?(cnpj)
  end
end

