RSpec.feature 'recipe deletion' do

  let!(:recipe) { FactoryGirl.create(:recipe) }
  let!(:recipe_two) { FactoryGirl.create(:recipe) }

  scenario 'can delete correct extant recipe' do
    visit recipes_path
    within("#recipe-information-#{recipe.id}") do
      click_on "Delete"
    end
    expect(page.body).to_not have_content(recipe.name)
  end
end
