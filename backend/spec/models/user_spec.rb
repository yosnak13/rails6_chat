require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーション" do
    let(:expected) { build(:user) }

    context "入力値が正しい場合" do
      it "バリデーションを通過すること" do
        expect(expected.name).to eq("sample")
        expect(expected.email).to eq("sample@example.com")
      end
    end
  end
end

