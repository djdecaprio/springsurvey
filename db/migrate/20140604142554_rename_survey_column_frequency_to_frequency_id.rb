class RenameSurveyColumnFrequencyToFrequencyId < ActiveRecord::Migration
  def up
    rename_column :surveys, :frequency, :frequency_id
  end

  def down
  end
end
