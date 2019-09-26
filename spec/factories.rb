FactoryBot.define do

  factory :user do
    email { Faker::Internet.email }
    password { 'password' }
  end

  factory :job do
    title { Faker::Job.title }
    description { Faker::Lorem.paragraph_by_chars(number: 1000) }
  end
end