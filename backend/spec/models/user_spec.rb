# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  describe "バリデーション" do
    let(:expected) { build(:user) }

    context "入力値が正しい場合" do
      it "バリデーションを通過すること" do
        expect(expected).to be_valid
      end
    end

    context "ユーザー名が不正な場合" do
      let(:invalid_user) { build(:user, name: "あ" * 31) }
      it "エラーになること" do
        expect(invalid_user).not_to be_valid
      end
    end

    context "メールアドレスが不正な場合" do
      let(:invalid_email) { build(:user, email: "example.com") }
      it "エラーになること" do
        expect(invalid_email).not_to be_valid
      end
    end
  end
end
