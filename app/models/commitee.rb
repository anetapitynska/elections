class Commitee < ActiveRecord::Base
  has_and_belongs_to_many :voivodeships
  has_and_belongs_to_many :voivodeships, :join_table => 'commitees_voivodeships'
  accepts_nested_attributes_for :voivodeships
  has_many :votes
end
