RSpec.feature 'tags listed alphabetically' do

  let!(:category1) { FactoryGirl.create(:category, :name => 'whaarflort') }
  let!(:category2) { FactoryGirl.create(:category, :name => 'a stupid tag because reasons') }
  let!(:category3) { FactoryGirl.create(:category, :name => 'top gun') }
  let!(:category4) { FactoryGirl.create(:category, :name => 'TOTALLY MOAR BUTTZ') }
  let!(:category5) { FactoryGirl.create(:category, :name => 'A ZTUPID BUTTZ') }

  scenario 'visit tags and see that they are alphabetical' do
    visit categories_path
    expect(category2.name).to appear_before (category3.name)
    expect(category3.name).to appear_before (category1.name)
    expect(category1.name).to_not appear_before (category3.name)
    expect(category1.name).to_not appear_before (category2.name)
  end

  scenario 'tags insensitive to up/downcase' do
    visit categories_path
    expect(category2.name).to appear_before (category5.name)
    expect(category3.name).to appear_before (category4.name)
  end

end
