RSpec.describe Category do
  it {is_expected.to have_valid(:name).when("tag") }
  it { is_expected.to_not have_valid(:name).when('', nil) }
end