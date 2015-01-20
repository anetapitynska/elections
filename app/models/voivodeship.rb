class Voivodeship < ActiveRecord::Base
	has_many :areas
	validates :name, presence: true, length: { minimum: 5 }, uniqueness: true 
end
