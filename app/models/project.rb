class Project < ActiveRecord::Base
	has_many :breakpoints
	has_many :users, :through => :breakpoints
end
