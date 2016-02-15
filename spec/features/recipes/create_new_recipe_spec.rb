RSpec.feature 'create_new_recipe' do

let!(:category) { FactoryGirl.create(:category) }

  scenario 'valid information' do
    visit root_path
    click_on 'new recipe'

    fill_in 'Name', :with => 'pants'
    check category.name
    click_on 'Create Recipe'

    expect(page.body).to have_link 'pants'
    expect(current_path).to eq recipes_path
  end

  scenario 'add extant tag to new recipe' do
    visit root_path
    click_on 'new recipe'

    fill_in 'Name', :with => 'more pants'
    check category.name
    click_on 'Create Recipe'
    click_on 'more pants'

    expect(page.body).to have_content 'unique'
  end

  scenario 'EQUIP INFOBOX' do
    visit root_path
    click_on 'new recipe'
    fill_in 'Name', :with => 'more pants'
    fill_in 'Infobox', :with => 'SOME FUCKING INFORMATION'
    click_on 'Create Recipe'
    click_on 'more pants'
    expect(page.body).to have_content "FUCKING"
  end

  scenario 'graceful fail when name not included' do
    visit root_path
    click_on 'new recipe'
    check category.name
    click_on 'Create Recipe'

    expect(page.body).to have_content "can't be blank"
    expect(current_path).to eq recipes_path
  end

  # scenario 'invalid recipe doesn\'t save; redirects to recipe/new' do

  # end
end