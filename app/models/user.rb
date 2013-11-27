class User < ActiveRecord::Base
  validates :email, uniqueness: true
  validates :name, presence: true



end
