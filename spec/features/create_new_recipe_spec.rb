RSpec.feature 'create_new_recipe' do

  scenario 'valid information' do
    visit root_path
    click_on 'new recipe'

    binding.pry
# Name! Capitals! type isn't necessary, figure that out
    fill_in 'name', :with => 'pants'
    select 'type'
    click_on 'create'
  end
end