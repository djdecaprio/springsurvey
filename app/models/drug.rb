class Drug < ActiveRecord::Base
  attr_accessible :drug_name

  has_many :surveys

end
