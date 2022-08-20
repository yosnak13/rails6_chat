# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Auth', type: :request do
  let!(:user) { create(:user) }

  describe 'POST /auth/sign_in' do
    context '正常系' do
      it 'HTTPステータスが200であること' do
        post '/auth/sign_in', params: { email: user['email'], password: 'password' }
        expect(response).to have_http_status(200)
        data = JSON.parse(response.body)
        expect(data['data']['email']).to eq(user['email'])
      end
    end

    context '異常系' do
      it 'HTTPステータスが401であること' do
        post '/auth/sign_in', params: { email: user['email'], password: 'xxxxxxxx' }
        expect(response).to have_http_status(401)
        data = JSON.parse(response.body)
        expect(data['success']).to eq(false)
      end
    end
  end
end
