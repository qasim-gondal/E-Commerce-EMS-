FactoryBot.define do
  factory :cart do
    
  end

  factory :user do
    email { Faker::Internet.email }
    password { "qasim1212" }
  end
end
