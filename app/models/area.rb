class Area < ActiveRecord::Base
  belongs_to :voivodeship
  has_many :votes, dependent: :destroy
  has_many :users
end
