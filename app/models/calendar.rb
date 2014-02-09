class Calendar < ActiveRecord::Base
  include Tokenable

  validates :title, :user, presence: true
  belongs_to :user
  has_many :events
end
