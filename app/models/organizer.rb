class Organizer < ActiveRecord::Base
  validates :name, presence: true
  has_many :events
  has_one :location

end
