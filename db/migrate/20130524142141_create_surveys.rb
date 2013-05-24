class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.integer :gender
      t.float :ecnounters
      t.integer :age
      t.integer :credits
      t.float :gpa
      t.integer :user_id

      t.timestamps
    end
  end
end
