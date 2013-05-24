class Survey < ActiveRecord::Base
  attr_accessible :age, :credits, :ecnounters, :gender, :gpa, :user_id
end
