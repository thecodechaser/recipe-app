# frozen_string_literal: true

class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods

  validates :name, presence: true, length: { in: 1..50 }
  validates :prepration_time, presence: true, length: { in: 1..100 }
  validates :cooking_time, presence: true, length: { in: 1..100 }
  validates :description, presence: true, length: { in: 1..300 }
end
