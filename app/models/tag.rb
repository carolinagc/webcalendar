class Tag < ActiveRecord::Base
  validates :tag, presence: true 
  has_and_belongs_to_many :events
end
