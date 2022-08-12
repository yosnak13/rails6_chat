# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'sample' }
    email { 'sample@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
