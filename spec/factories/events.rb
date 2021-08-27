FactoryBot.define do
  factory :event do
    dog { nil }
    name { "MyString" }
    completed { false }
    event_datetime { "2021-08-26 19:29:42" }
  end
end
