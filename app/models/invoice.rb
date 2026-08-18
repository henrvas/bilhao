class Invoice < ApplicationRecord
  belongs_to :enrolloment

  validates :price_invoice, presence: true, numericality: { only_integer: true }
  validates :status_invoice, presence: true, inclusion: { in: ['aberta'] }
end


