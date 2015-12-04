RSpec.feature 'can edit extant recipe' do

  let!(:recipe) { FactoryGirl.create(:recipe) }

  scenario 'edit title and content' do
    visit recipes_path
    click_on 'Edit'
    fill_in 'Name', :with => 'different pants'
    binding.pry
    fill_in 'Infobox', :with => 'here is recipe'

    click_on 'Update Recipe'

    expect(page.body).to have_content ('different pants')
    binding.pry
    expect(page.body).to have_content ('here is recipe')
  end
end
