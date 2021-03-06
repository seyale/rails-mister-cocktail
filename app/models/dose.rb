class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :cocktail_id, uniqueness: { scope: :ingredient }
  validates :description, presence: true
end
