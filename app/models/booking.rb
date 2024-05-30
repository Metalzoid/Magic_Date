class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  has_many :ratings, dependent: :destroy
  STATUS = ["En attente", "En cours", "Effectuée", "Refusée"]

  validates :total_price, presence: true, numericality: { only_integer: true }
  validates :start_date, presence: true
  validates :end_date, comparison: { greater_than: :start_date },
                       presence: true
  validates :comment, presence: true
  validates :status, presence: true, inclusion: { in: STATUS }


end
