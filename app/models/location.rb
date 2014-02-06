class Location < ActiveRecord::Base
  validates :name, :address,  presence: true
  VALID_URL_REGEX = /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?\z/
  validates :url, format: { with: VALID_URL_REGEX }, allow_blank: true
  has_many :events, dependent: :nullify
  has_many :organizers
end
