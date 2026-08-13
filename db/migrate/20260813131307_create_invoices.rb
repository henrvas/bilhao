class CreateInvoices < ActiveRecord::Migration[8.1]
  def change
    create_table :invoices do |t|
      t.string :price_invoice
      t.string :invoice_status

      t.timestamps
    end
  end
end
