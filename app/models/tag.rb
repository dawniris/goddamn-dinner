class Tag < ActiveRecord::Base
  validates :name, presence: true
  has_many :recipes, through: :recipe_tags
  has_many :recipe_tags
end