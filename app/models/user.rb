require 'pry'
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo
  has_many :offers, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :favourites, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ROLES = %w[vendor client]
  validates :role, inclusion: { in: ROLES }, allow_nil: true

  def average
    result = 0
    ratings.each { |rating| result += rating.score }
    result /= ratings.count if ratings.count.positive?
    return result
  end
end
