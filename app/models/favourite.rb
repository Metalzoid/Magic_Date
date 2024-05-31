class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :offer

  validates :user, presence: true, uniqueness: { scope: :offer }
end
