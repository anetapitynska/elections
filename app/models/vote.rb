class Vote < ActiveRecord::Base
  belongs_to :area
  belongs_to :commitee
  validates :commitee, presence: true
  validates :area, presence: true
  validates :number, presence: true

  validates :commitee, :area,  uniqueness: {scope: [:commitee, :area] }
  #validates :commitee, uniqueness: {scope: :area}
  #validates_uniqueness_of :commitee, :scope => :area
end