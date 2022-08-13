# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Messages', type: :request do
  describe '#index' do
    context 'getリクエストが正しいとき' do
      let(:expected) { build(:message) }
      # let(:message_mock) { Message.new }
      let(:params) { JSON.parse(expected.to_json) }

      # before do
      #   allow(Message).to receive(:new).and_return(message_mock)
      #   allow(message_mock).to receive(:index).with(expected).and_return(:params)
      # end

      it 'jsonを返すこと' do
        get "http://localhost:3000/messages"
        expect(status).to be(200)
        # expect(actual[:content]).to be(expected)
      end
    end
  end
end
