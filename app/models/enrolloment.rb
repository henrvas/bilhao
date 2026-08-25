class Enrolloment < ApplicationRecord
  belongs_to :student
  belongs_to :educational_institute
  has_many :invoices, dependent: :destroy

  validates :full_price_course, presence: true, numericality: { greater_than: 0 }
  validates :number_invoices, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :invoice_due_date, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 31 }
  validates :name_course, presence: true
  validates :student_id, presence: true
  validates :educational_institute_id, presence: true

  validate :aluno_e_instituicao_ativos
  validate :aluno_concluiu_nivel_anterior

  after_create :create_invoices

  def create_invoices
    invoice_value = (full_price_course / number_invoices).round(2)
    remainder = full_price_course - (invoice_value * number_invoices)
    today = Date.today
    first_month = invoice_due_date <= today.day ? today.next_month : today

    number_invoices.times do |i|
      value = invoice_value
      value += remainder if i == number_invoices - 1

      Invoice.create!(
        enrolloment: self,
        price_invoice: value,
        invoice_status: 'aberta',
        invoice_due_date: date_for_day(first_month + i.months, invoice_due_date)
      )
    end
  end

  private

  def aluno_e_instituicao_ativos
    return unless student && educational_institute

    if student.status != 'ativo' || educational_institute.status_educational_institute != 'ativo'
      errors.add(:base, "não é possível criar a matrícula pois o aluno ou a instituição estão desativados")
    end
  end

  def aluno_concluiu_nivel_anterior
    return unless student && educational_institute

    levels = EducationalInstitute::SCHOOL_TYPES
    target_index = levels.index(educational_institute.school_type)
    return if target_index.nil? || target_index.zero?

    previous_level = levels[target_index - 1]
    completed_index = levels.index(student.highest_completed_level)

    unless completed_index && completed_index >= target_index - 1
      errors.add(:base, "aluno não pode se matricular porque ainda não concluiu #{previous_level}")
    end
  end

  def date_for_day(reference_month, day)
    last_day_of_month = Date.new(reference_month.year, reference_month.month, -1).day
    Date.new(reference_month.year, reference_month.month, [day, last_day_of_month].min)
  end
end
