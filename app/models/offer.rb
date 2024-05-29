class Offer < ApplicationRecord
  belongs_to :user

  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true
end
