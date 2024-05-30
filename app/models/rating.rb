class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :booking

  validates :score, presence: true, numericality: { only_integer: true, in: 0..5 }
end
