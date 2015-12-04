RSpec.feature 'view new recipe' do

  let!(:recipe) { FactoryGirl.create(:recipe) }

  scenario 'can see content' do
    visit recipes_path
    click_on recipe.name

    expect(page.body).to have_content(recipe.name)
    expect(page.body).to have_content(recipe.infobox)
    expect(current_path).to eq recipe_path(:id => recipe.id)
  end
end