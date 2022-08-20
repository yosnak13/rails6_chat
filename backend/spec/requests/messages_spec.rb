# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Messages', type: :request do
  describe '#index' do
    let!(:user) { create(:user) }

    def auth_headers
      post '/auth/sign_in', params: {email: user['email'], password: 'password'}
      { 'uid'=>response.header['uid'], 'client'=>response.header['client'], 'access-token'=>response.header['access-token'] }
    end

    context 'getリクエストが正しいとき' do
      let(:params) { build(:message) }

      it 'httpステータスが200になること' do
        get messages_path, headers: auth_headers
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
