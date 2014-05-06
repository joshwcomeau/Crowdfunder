class User < ActiveRecord::Base
	has_many :breakpoints
	has_many :projects, :through => :breakpoints
end
