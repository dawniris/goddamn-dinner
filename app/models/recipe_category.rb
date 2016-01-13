class RecipeCategory < ActiveRecord::Base
  validates :recipe_id, presence: true
  validates :category_id, presence: true
  belongs_to :recipe
  belongs_to :category
end