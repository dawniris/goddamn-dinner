RSpec.feature 'add_tag_to_recipe' do

let!(:category) { FactoryGirl.create(:category) }
let!(:recipe) { FactoryGirl.create(:recipe) }

  scenario 'add extant tag' do
    visit recipes_path
    within("#recipe-information-#{recipe.id}") do
      click_on 'Edit'
    end

    check(category.name)
    click_on 'Update Recipe'
    click_on recipe.name
    expect(page.body).to have_content "unique"
  end

end