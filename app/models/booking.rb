class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :user
  validates :car, presence: true
  validates :user, presence: true
  validates :start_date, presence: true
end
