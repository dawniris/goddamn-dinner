class CreateRecipeTags < ActiveRecord::Migration
  def change
    create_table :recipe_tags do |t|
      t.belongs_to :recipe, index: true
      #:tag can be changed to :tags without failure -- also strange.
      t.belongs_to :tag, index: true
      t.timestamps null: false
    end
  end
end
