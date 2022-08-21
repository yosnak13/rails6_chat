# frozen_string_literal: true

class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    user = User.find_by(email: data["email"])

    # if message = Message.create(content: data["message"], user_id: user.id)
    #   ActionCable.server.broadcast "room_channel", { message: data["message"], name: user.name, created_at: message.created_at }
    # end

    message = Message.new(message_params)
    ActionCable.server.broadcast "room_channel", { message: data["message"], name: user.name, created_at: message.created_at } if message.save
  end

  private

  def message_params
    params.require(:message).permit(:content, user_id)
  end
end