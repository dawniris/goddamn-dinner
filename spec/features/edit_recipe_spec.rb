RSpec.feature 'can edit extant recipe' do

  let!(:recipe) { FactoryGirl.create(:recipe) }
  let!(:recipe_two) { FactoryGirl.create(:recipe) }

  scenario 'edit title and content' do
    visit recipes_path
    within("#recipe-information-#{recipe.id}") do
      click_on 'Edit'
    end
    binding.pry
    fill_in 'Name', :with => 'different pants'
    fill_in 'box', :with => 'here is recipe'
    click_on 'Update Recipe'
    expect(page.body).to have_content ('different pants')
    expect(page.body).to have_content ('here is recipe')
  end

  scenario 'edit correct recipe' do
    visit recipes_path
    within("#recipe-information-#{recipe_two.id}") do
      click_on 'Edit'
    end
    expect(page.body).to have_field('Name', :with => recipe_two.name)
    expect(page.body).to have_content(recipe_two.infobox)
    expect(page.body).to_not have_content(recipe.name)
  end
end
