class AddDrugIdToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :drug_id, :integer
    add_column :surveys, :frequency, :integer
  end
end
