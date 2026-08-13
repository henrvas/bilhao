class CreateStudents < ActiveRecord::Migration[8.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :cnpj
      t.date :date_of_birth
      t.decimal :cell_number
      t.string :gender
      t.string :payment_method

      t.timestamps
    end
  end
end
