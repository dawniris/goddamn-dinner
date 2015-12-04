RSpec.feature 'create_new_recipe' do

  scenario 'valid information' do
    visit root_path
    click_on 'new recipe'

    fill_in 'Name', :with => 'pants'
    ## haven't bothered implementing type yet; suck it
    # select 'type'
    click_on 'Create Recipe'

    expect(page.body).to have_link 'pants'
    expect(current_path).to eq recipes_path
  end
end