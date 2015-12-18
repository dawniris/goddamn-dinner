class Recipe < ActiveRecord::Base
  validates :name, presence: true
  has_many :tags, through: :recipe_tags
  has_many :recipe_tags
end