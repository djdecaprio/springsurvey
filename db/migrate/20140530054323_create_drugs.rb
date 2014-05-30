class CreateDrugs < ActiveRecord::Migration
  def change
    create_table :drugs do |t|
      t.text :name

      t.timestamps
    end
  end
end
