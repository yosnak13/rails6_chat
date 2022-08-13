# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'バリデーション' do
    context '入力値が正しい場合' do
      let(:expected) { build(:message) }
      it 'バリデーションを通過すること' do
        messaged_user = expected.user

        expect(expected).to be_valid
        expect(messaged_user).to be_present
        expect(messaged_user.name).to be_present
        expect(messaged_user.email).to be_present
      end
    end

    context '入力値が不正な場合' do
      let(:invalid) { build(:message, content: '') }
      it 'エラーになること' do
        expect(invalid).not_to be_valid
      end
    end
  end
end
