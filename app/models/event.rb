class Event < ActiveRecord::Base
  validates :name, :event_type,  :day,  presence: true
  belongs_to :location
  belongs_to :organizer
end
