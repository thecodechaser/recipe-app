# frozen_string_literal: true

class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipes_foods
  has_many :foods, through: :recipes_foods
end
