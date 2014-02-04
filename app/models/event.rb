class Event < ActiveRecord::Base
  validates :name, :event_type, :startdatetime, :calendar, presence: true
  has_many :taggings
  has_many :tags, through: :taggings
  belongs_to :location
  belongs_to :organizer
  belongs_to :calendar

  def enddatetime
    self.startdatetime + self.duration
  end
end
