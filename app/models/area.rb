class Area < ActiveRecord::Base
  belongs_to :voivodeship
  has_many :votes, dependent: :destroy
  has_many :users
  validates :name, presence: true, length: { minimum: 5 }, uniqueness: true 
  validates :number, presence: true, uniqueness: true
	validates :people, presence: true



end
