class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offer

  validates :total_price, presence: true, numericality: { only_integer: true }
  validates :start_date, presence: true
  validates :end_date, comparison: { greater_than: :start_date },
                       presence: true
  validates :comment, presence: true
  validates :category, presence: true, inclusion: { in: STATUS }

  STATUS = ["En attente", "En cours", "Effectuée", "Refusée"]
end
