RSpec.feature 'edit_tag' do
  let!(:category) { FactoryGirl.create(:category) }
  let!(:recipe) { FactoryGirl.create(:recipe) }

  scenario 'edit existing tag' do
    visit root_path
    click_on 'alla tags'
    within("#category-information-#{category.id}") do
      click_on 'Edit'
    end

    fill_in 'Name', :with => 'another name'
    click_on 'Update Category'
    expect(page.body).to have_content 'another name'
    expect(current_path).to eq categories_path
  end

end