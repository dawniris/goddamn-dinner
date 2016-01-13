class Recipe < ActiveRecord::Base
  validates :name, presence: true
  #changing :tag to :tags causes three tests to fail -- investigate why! :recipes can be used as a plural
  has_many :category, through: :recipe_categories
  has_many :recipe_categories
end