FactoryGirl.define do

  factory :recipe do
    sequence(:name) { |n| "cheesy #{n} pants" }
    sequence(:infobox) { |n| "here is #{n} recipe" }
  end
end