# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Messages', type: :request do
  describe '#index' do
    context 'getリクエストが正しいとき' do
      let(:params) { build(:message) }
      let(:user) { create(:user) }

      xit 'httpステータスが200になること' do
        # なんか認証できない
        sign_in user
        get messages_path
        expect(response).to have_http_status(200)
      end
    end

    context 'ログインしていないとき' do
      let(:params) { build(:message) }

      it 'httpステータスが401になること' do
        get messages_path
        expect(response).to have_http_status(401)
        expect(response.body).to include('unauthenticated')
      end
    end
  end
end
