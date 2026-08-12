class CreateEducationalInstitutes < ActiveRecord::Migration[8.1]
  def change
    create_table :educational_institutes do |t|
      t.string :name
      t.string :cnpj
      t.string :school_type

      t.timestamps
    end
  end
end
