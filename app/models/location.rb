class Location < ActiveRecord::Base
  validates :name, :address, presence: true
  has_many :events
  has_many :organizers
end
