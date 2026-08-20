class CreateEnrolloments < ActiveRecord::Migration[8.1]
  def change
    create_table :enrolloments do |t|
      t.decimal :full_price_course
      t.decimal :number_invoices
      t.decimal :invoice_due_date
      t.string :name_course
      

      t.timestamps
    end
  end
end
