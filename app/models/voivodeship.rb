class Voivodeship < ActiveRecord::Base
  has_and_belongs_to_many :commitees   
	has_and_belongs_to_many :commitees, :join_table => 'commitees_voivodeships'
	accepts_nested_attributes_for :commitees
	has_many :areas, dependent: :destroy
	has_attached_file :image, :styles => { :large => "600x600>", :medium => "300x300>", :thumb => "80x80" } #, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	validates :name, presence: true, length: { minimum: 5 }, uniqueness: true 
	validates :seats, presence: true
	#def self.incommitee
	#	self.find_all_by_id([2, 3, 5])
	#end

	#voivodeships_of_commitee = Voivodeship.find_all_by_id([2, 3, 5])
end
