class Enrolloment < ApplicationRecord
  belongs_to :student
  belongs_to :educational_institute
  has_many :invoices, dependent: :destroy

  validates :full_price_course, presence: true, numericality: { only_integer: true }
  validates :number_invoices, presence: true, numericality: { only_integer: true }
  validates :invoice_due_date, presence: true
  validates :name_course, presence: true
  validates :student_id, presence: true

  after_create :create_invoices

  def create_invoices
    invoice_value = full_price_course / number_invoices
    due_date = invoice_due_date

    number_invoices.times do |i|
      Invoice.create!(
        enrolloment: self,
        price_invoice: invoice_value,
        invoice_status: 'aberta',
        invoice_due_date: due_date
      )
    end
  end
end
