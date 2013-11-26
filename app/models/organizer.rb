class Organizer < ActiveRecord::Base
  validates :name, presence: true
  has_many :events, dependent: :nullify
  has_one :location

end
