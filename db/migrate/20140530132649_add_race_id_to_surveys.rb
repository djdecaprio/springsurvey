class AddRaceIdToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :race_id, :integer
  end
end
