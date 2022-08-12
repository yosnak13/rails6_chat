# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    # 対象factory名をアソシエーションに追加
    association :user
    content { Faker::Lorem.sentence }
  end
end
