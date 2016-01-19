RSpec.feature 'create_new_tag' do

  scenario 'create tag from no tag' do
    visit root_path
    click_on 'new tag'

    fill_in 'Name', :with => 'taagus'

    click_on 'Create Category'

    expect(page.body).to have_content 'taagus'
    expect(current_path).to eq categories_path
  end

end