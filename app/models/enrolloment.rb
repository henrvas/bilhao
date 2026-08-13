class Enrolloment < ApplicationRecord
  belongs_to :student
  belongs_to :educational_institute


  validates :full_price, presence: true, numericality: { only_integer: true }
  validates :number_invoices, presence: true, numericality: { only_integer: true }
  validates :invoice_due_date, presence: true
  validates :name_course, presence: true
  validates :student_id, presence: true
end
