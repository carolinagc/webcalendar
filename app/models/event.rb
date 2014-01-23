class Event < ActiveRecord::Base
  validates :name, :event_type,  :day, presence: true
  has_many :taggings
  has_many :tags, through: :taggings
  belongs_to :location
  belongs_to :organizer

  def duration        
    if (val=self[:duration]).nil?
      0
    else
      val
    end
  end
end
