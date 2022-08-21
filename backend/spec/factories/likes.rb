# frozen_string_literal: true

FactoryBot.define do
  factory :like do
    # こちらを採用したいが、実装できていない
    id { rand(1..10) }
    association :message, factory: :message
    user { message.user }
  end

  factory :like_sample, class: "like" do
    id { rand(1..10) }
    user_id { 1 }
    message_id { 1 }
  end
end
