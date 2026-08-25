class Enrolloment < ApplicationRecord
  belongs_to :student
  belongs_to :educational_institute
  has_many :invoices, dependent: :destroy

  validates :full_price_course, presence: true, numericality: { greater_than: 0 }
  validates :number_invoices, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :invoice_due_date, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 31 }
  validates :name_course, presence: true
  validates :student_id, presence: true

  after_create :create_invoices

  def create_invoices
    invoice_value = full_price_course / number_invoices
    today = Date.today
    first_month = invoice_due_date <= today.day ? today.next_month : today

    number_invoices.times do |i|
      Invoice.create!(
        enrolloment: self,
        price_invoice: invoice_value,
        invoice_status: 'aberta',
        invoice_due_date: date_for_day(first_month + i.months, invoice_due_date)
      )
    end
  end

  private

  def date_for_day(reference_month, day)
    last_day_of_month = Date.new(reference_month.year, reference_month.month, -1).day
    Date.new(reference_month.year, reference_month.month, [day, last_day_of_month].min)
  end
end
