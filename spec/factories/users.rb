FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { '123456' }
    password_confirmation { '123456' }

    trait :admin do
      role { User.role.admin }
    end
  end
end
