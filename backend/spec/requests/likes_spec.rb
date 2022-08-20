# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Likes", type: :request do
  describe "POST /messages/message_id/likes" do
    let!(:user) { create(:user) }

    def auth_headers
      post "/auth/sign_in", params: { email: user.email, password: user.password }
      { "uid" => response.header["uid"], "client" => response.header["client"], "access-token" => response.header["access-token"] }
    end

    context "正常系" do
      let!(:message) { create(:message, user_id: user.id) }

      it "httpステータスが200でレスポンスが帰ってくること" do
        post "/messages/#{message.id}/likes", headers: auth_headers

        expect(response.status).to eq(200)
        data = JSON.parse(response.body)
        expect(data["id"]).to eq(user.id)
        expect(data["email"]).to eq(user.email)
        expect(data["message"]).to include("成功しました")
      end
    end

    context "異常系" do
      it "エラーが返され、httpステータスが400であること" do
        # 不正なmessage_idをリクエスト
        post "/messages/999999/likes", headers: auth_headers

        expect(response.status).to eq(400)
        data = JSON.parse(response.body)
        expect(data["message"]).to include("保存出来ませんでした")
      end
    end
  end
end
