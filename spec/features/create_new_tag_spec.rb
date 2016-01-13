RSpec.feature 'create_new_tag' do

  scenario 'create tag from no tag' do
    visit root_path
    click_on 'new recipe'
    click_on 'New Tag'

    fill_in 'Name', :with => 'taagus'

    click_on 'Create Category'

    expect(page.body).to have_content 'taagus'
    expect(current_path).to eq new_recipe_path
  end

end