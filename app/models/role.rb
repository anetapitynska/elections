class Role < ActiveRecord::Base
	has_many :users
	validates :name, presence: true, length: { minimum: 5 }, uniqueness: true 
	validates :description,  presence: true
	
end
