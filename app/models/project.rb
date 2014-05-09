class Project < ActiveRecord::Base
	has_many :tiers
	has_many :users, :through => :tiers
	has_many :pledges
	mount_uploader :image, ImageUploader
	accepts_nested_attributes_for :tiers
end
