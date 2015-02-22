class Commitee < ActiveRecord::Base
  has_and_belongs_to_many :voivodeships
  has_and_belongs_to_many :voivodeships, :join_table => 'commitees_voivodeships'
  accepts_nested_attributes_for :voivodeships
  has_many :votes, dependent: :destroy

  has_attached_file :image, :styles => { :large => "600x600>", :medium => "300x300>", :thumb => "80x80#" } #, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
