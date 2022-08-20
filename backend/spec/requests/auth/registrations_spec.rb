# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Auth::Registrations', type: :request do
  describe 'POST /auth' do
    context '正常系' do
      let(:auth_user) { { name: '認証テスト', email: 'test@example.com', password: 'password', password_confirmation: 'password' } }

      it 'ユーザー認証ができること' do
        post '/auth', params: auth_user
        data = JSON.parse(response.body)
        expect(response).to have_http_status(200)
        expect(data['status']).to eq('success')
      end
    end
  end
end
