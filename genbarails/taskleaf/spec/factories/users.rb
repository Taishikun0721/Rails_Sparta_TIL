FactoryBot.define do
  factory :user do
    name {'Genba Rails'}
    sequence(:email) {|n| "test#{n}@example.com"}
    password {'password'}
    password_confirmation {'password'}
  end
end
