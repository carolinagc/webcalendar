class Tag < ActiveRecord::Base
  validates :name, presence: true
  has_many :taggings
  has_many :events, through: :taggings
end
