class CreateStudents < ActiveRecord::Migration[8.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :cpf
      t.date :date_of_birth
      t.decimal :cell_number
      t.string :gender
      t.string :method_of_payment

      t.timestamps
    end
  end
end
