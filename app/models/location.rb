class Location < ActiveRecord::Base
  validates :name, :address,  presence: true
  has_many :events, dependent: :nullify
  has_many :organizers
end
