# frozen_string_literal: true

class Food < ApplicationRecord
  belongs_to :user
  has_many :recipes_foods, dependent: :destroy
  has_many :recipes, through: :recipes_foods

end
