class Event < ActiveRecord::Base
  validates :name, :event_type,  :day,  presence: true
  has_and_belongs_to_many :tags
  belongs_to :location
  belongs_to :organizer
end
