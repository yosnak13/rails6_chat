# frozen_string_literal: true

require "rails_helper"

RSpec.describe RoomChannel, type: :channel do
  xdescribe "メッセージの送受信" do

    context "正常時" do
      let!(:user) { build(:user) }
      let!(:message) { build(:message, user_id: user.id) }

      before do
        stub_connection
      end

      it "メッセージが保存されること" do
        expect do
          perform :post, message: message.content
        end. to change(Message, :count).by(1)
      end
    end
  end
end
