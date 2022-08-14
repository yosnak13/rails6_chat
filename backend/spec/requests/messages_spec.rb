# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Messages', type: :request do
  describe '#index' do
    context 'getリクエストが正しいとき' do
      let(:params) { build(:message) }

      it 'httpステータスが200になること' do
        get messages_path
        expect(status).to be(200)
      end
    end
  end
end
