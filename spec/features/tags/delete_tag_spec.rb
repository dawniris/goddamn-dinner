RSpec.feature 'delete_tag' do

  let!(:category) { FactoryGirl.create(:category) }

  scenario 'delete tag' do
    visit categories_path
    within("#category-information-#{category.id}") do
      click_on "Delete"
    end
    expect(page.body).to_not have_content category.name
  end

end
