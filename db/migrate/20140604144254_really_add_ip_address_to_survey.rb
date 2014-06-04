class ReallyAddIpAddressToSurvey < ActiveRecord::Migration
  def up
    add_column :surveys, :ip_address, :string
  end

  def down
  end
end
