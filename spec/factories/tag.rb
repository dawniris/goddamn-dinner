FactoryGirl.define do

  factory :tag do
    sequence(:name) { |x| "unique #{x} tag"}
  end
end