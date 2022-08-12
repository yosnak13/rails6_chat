# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーション' do
    let(:expected) { build(:user) }

    context '入力値が正しい場合' do
      it 'バリデーションを通過すること' do
        expect(expected).to be_valid
      end
    end
  end
end
