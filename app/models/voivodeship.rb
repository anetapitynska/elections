class Voivodeship < ActiveRecord::Base
	has_many :areas
	has_and_belongs_to_many :commitees
	validates :name, presence: true, length: { minimum: 5 }, uniqueness: true 
end
