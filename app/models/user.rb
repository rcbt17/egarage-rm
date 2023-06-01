class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d-]+(\.[a-z\d-]+)*\.[a-z]+\z/i

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :last_name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :phone_number, presence: true, length: { minimum: 8, maximum: 11 }, numericality: true
  validates :email, length: { minimum: 10, maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  validates :encrypted_password, presence: true, length: { minimum: 6, maximum: 255 }
  validates :password_confirmation, presence: true, length: { minimum: 6, maximum: 255 }
end
