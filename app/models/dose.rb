class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :cocktail, presence: true
  validates :ingredient, presence: true
  validates :description, presence: true, allow_blank: false

  validates_uniqueness_of :cocktail, :scope => :ingredient
end
