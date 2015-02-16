class Area < ActiveRecord::Base
  belongs_to :voivodeship
  has_many :votes
  has_many :users
end
