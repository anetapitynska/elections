class Voivodeship < ActiveRecord::Base
  has_and_belongs_to_many :commitees
	has_many :areas
	has_and_belongs_to_many :commitees, :join_table => 'commitees_voivodeships'
	accepts_nested_attributes_for :commitees
	validates :name, presence: true, length: { minimum: 5 }, uniqueness: true 
end
