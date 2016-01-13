RSpec.feature 'add_new_tag' do

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
binding.pry
    expect(page.body).to have_content "unique"
  end

end