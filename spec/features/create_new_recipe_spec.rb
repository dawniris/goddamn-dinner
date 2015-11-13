RSpec.feature 'create_new_recipe' do

  scenario 'valid information' do
    visit root_path
    click_on 'new recipe'

    binding.pry
    fill_in 'Name', :with => 'pants'
    #'type' isn't necessary, facilitate use
    # select 'type'
    click_on 'Create Recipe'
  end
end