class ChangeCellNumberTypeOnStudents < ActiveRecord::Migration[8.1]
  def up
    change_column :students, :cell_number, :string
  end

  def down
    change_column :students, :cell_number, :decimal
  end
end
