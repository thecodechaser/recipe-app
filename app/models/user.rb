# frozen_string_literal: true

class User < ApplicationRecord
  has_many :foods
  has_many :recipes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  def admin?(requested_role)
    role == requested_role.to_s
  end
end
