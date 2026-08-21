class CreateEnrolloments < ActiveRecord::Migration[8.1]
  def change
    create_table :enrolloments do |t|
      t.references :student, foreign_key: true
      t.references :educational_institute, foreign_key: true
      t.decimal :full_price_course
      t.integer :number_invoices
      t.integer :invoice_due_date
      t.string :name_course

      t.timestamps
    end
  end
end
