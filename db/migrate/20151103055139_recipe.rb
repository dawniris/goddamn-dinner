class Recipe < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.text :infobox

      t.timestamps null: false
    end
  end
end
