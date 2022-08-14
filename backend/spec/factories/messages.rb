# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    # 対象factory名をアソシエーションに追加
    association :user, factory: :messaged_user
    content { Faker::Lorem.sentence }
    created_at { Time.current }
    updated_at { Time.current }
  end
end
