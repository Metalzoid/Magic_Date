class Offer < ApplicationRecord
  CATEGORIES = ["Texto", "Site de rencontre", "Accompagnement", "Coaching"]

  belongs_to :user
  has_many :favourites, dependent: :destroy

  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
end
