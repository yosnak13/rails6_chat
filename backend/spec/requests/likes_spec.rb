# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Likes", type: :request do
  def auth_headers
    post "/auth/sign_in", params: { email: user.email, password: user.password }
    { "uid" => response.header["uid"], "client" => response.header["client"], "access-token" => response.header["access-token"] }
  end

  describe "POST /messages/message_id/likes" do
    let!(:user) { create(:user) }
    let!(:message) { create(:message, user_id: user.id) }

    context "正常系" do
      it "レスポンスが返され、httpステータスが200であること" do
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

  describe "DELETE /likes/message_id" do
    let!(:user) { create(:user) }

    context "正常系" do
      let!(:message) { create(:message, user_id: user.id) }
      let!(:like) { create(:like_sample, message_id: message.id, user_id: message.user_id) }

      it "likeを削除し、httpステータスが200であること" do
        delete "/likes/#{like.id}", headers: auth_headers

        expect(response.status).to eq(200)
        data = JSON.parse(response.body)
        expect(data["id"]).to eq(like.id)
        expect(data["email"]).to eq(message.user.email)
        expect(data["message"]).to include("削除に成功しました")
      end
    end
  end
end
