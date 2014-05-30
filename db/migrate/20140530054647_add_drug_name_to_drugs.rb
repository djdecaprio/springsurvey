class AddDrugNameToDrugs < ActiveRecord::Migration
  def change
    add_column :drugs, :drug_name, :string
    remove_column :drugs, :name
  end
end
