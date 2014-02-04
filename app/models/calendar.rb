class Calendar < ActiveRecord::Base
  validates :url, :title, :user, presence: true
  belongs_to :user
  has_many :events
end
