# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    id { 1 }
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end

  factory :messaged_user, class: 'User' do
    id { rand(1..5) }
    name { 'poseted_user' }
    email { 'posted@example.com' }
  end
end
