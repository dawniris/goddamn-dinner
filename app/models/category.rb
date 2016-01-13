class Category < ActiveRecord::Base
  validates :name, presence: true
  has_many :recipes, through: :recipe_categories
  has_many :recipe_categories
end