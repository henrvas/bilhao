class AddJurosAndPaidAtToInvoices < ActiveRecord::Migration[8.1]
  def change
    add_column :invoices, :juros, :decimal, default: 0, null: false
    add_column :invoices, :paid_at, :datetime
  end
end
