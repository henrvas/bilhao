class Enrolloment < ApplicationRecord
  belongs_to :student
  belongs_to :educational_institute
  has_many :invoices, dependent: :destroy

  validates :full_price, presence: true, numericality: { only_integer: true }
  validates :number_invoices, presence: true, numericality: { only_integer: true }
  validates :invoice_due_date, presence: true
  validates :name_course, presence: true
  validates :student_id, presence: true
end

after_create :create_invoices

def create_invoices
  invoice_value = full_price / number_invoices
  due_date = invoice_due_date

  number_invoices.times do |i|
    Invoice.create!(
      enrolloment: self,
      price_invoice: invoice_value,
      status_invoice: 'aberta',
      due_date: due_date + i.months
    )
  end
end

