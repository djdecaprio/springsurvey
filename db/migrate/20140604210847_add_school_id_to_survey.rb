class AddSchoolIdToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :school_id, :integer
  end
end
