class CreateInvoices < ActiveRecord::Migration[8.1]
  def change
    create_table :invoices do |t|
      t.string :price_invoice
      t.string :invoice_status
      t.string :invoice_due_date
      t.references :enrolloment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
