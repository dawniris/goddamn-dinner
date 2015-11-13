RSpec.feature 'create_new_recipe' do

  scenario 'valid information' do
    visit root_path
    binding.pry
    click_on 'new recipe'

    fill_in 'Name', :with => 'pants'
    # type isn't necessary, figure that out
    # select 'type'

    click_on 'Create Recipe'
    # visit root_path
  end
end