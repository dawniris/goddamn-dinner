FactoryGirl.define do

  factory :category do
    sequence(:name) { |x| "unique #{x} tag"}
  end
end