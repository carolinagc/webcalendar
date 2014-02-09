class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true
  has_many :calendars

  def current_calendar
    Calendar.where(id: current_calendar_id)
  end

  def current_calendar=(calendar)
    current_calendar_id = calendar.id
  end
end
