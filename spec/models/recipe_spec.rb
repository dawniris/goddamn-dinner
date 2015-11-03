RSpec.describe Recipe do

  it { is_expected.to have_valid(:name).when('wharrgarbl') }
  it { is_expected.to_not have_valid(:name).when('', nil) }
end