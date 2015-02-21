class Voivodeship < ActiveRecord::Base
  has_and_belongs_to_many :commitees
  has_many :areas
	has_and_belongs_to_many :commitees, :join_table => 'commitees_voivodeships'
	accepts_nested_attributes_for :commitees
	validates :name, presence: true, length: { minimum: 5 }, uniqueness: true 

	#def self.incommitee
	#	self.find_all_by_id([2, 3, 5])
	#end

	#voivodeships_of_commitee = Voivodeship.find_all_by_id([2, 3, 5])
end
