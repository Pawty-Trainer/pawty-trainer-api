FactoryBot.define do
  factory :dog do
    user { nil }
    breed { "MyString" }
    name { "MyString" }
    age { 1 }
  end
end
