RSpec.feature 'show_tag_recipe_associations' do

let!(:category) { FactoryGirl.create(:category, :name => 'dinner') }
let!(:category2) { FactoryGirl.create(:category, :name => 'italian') }
let!(:recipe) { FactoryGirl.create(:recipe, :name => 'pasta') }
let!(:recipe2) { FactoryGirl.create(:recipe, :name => 'pizza') }

  before :each do
    [recipe, recipe2].each do |rec|
      rec.categories << category
      rec.categories << category2
    end
  end

  scenario 'view tag and see associated recipes' do
    visit category_path(:id => category.id)
    expect(page.body).to have_link "pizza"
    expect(page.body).to have_link "pasta"
  end

  scenario 'view recipe and see associated tags' do
    visit recipe_path(:id => recipe.id)
    expect(page.body).to have_link "dinner"
    expect(page.body).to have_link "italian"
  end
end