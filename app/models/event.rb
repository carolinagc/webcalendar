class Event < ActiveRecord::Base
  validates :name, :event_type,  :day, presence: true
  has_many :taggins
  has_many :tags, through: :taggins
  belongs_to :location
  belongs_to :organizer
end
