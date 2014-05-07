class Project < ActiveRecord::Base
	has_many :breakpoints
	has_many :users, :through => :breakpoints

  accepts_nested_attributes_for :breakpoints
end
