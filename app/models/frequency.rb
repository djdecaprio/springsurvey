class Frequency < ActiveRecord::Base
  attr_accessible :name

  has_many :surveys
end
