class AddStatusEducationalInstituteToEducationalInstitutes < ActiveRecord::Migration[8.1]
  def change
    add_column :educational_institutes, :status_educational_institute, :string, default: "ativo"
  end
end
