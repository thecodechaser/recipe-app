# frozen_string_literal: true

class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipes_foods, dependent: :destroy
  has_many :foods, through: :recipes_foods
end
