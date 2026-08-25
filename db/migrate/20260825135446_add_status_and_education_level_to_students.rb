class AddStatusAndEducationLevelToStudents < ActiveRecord::Migration[8.1]
  def change
    add_column :students, :status, :string, default: "ativo", null: false
    add_column :students, :highest_completed_level, :string
  end
end
