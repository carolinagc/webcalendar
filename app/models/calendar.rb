class Calendar < ActiveRecord::Base
  validates :title, :user, presence: true
  belongs_to :user
  has_many :events
end
