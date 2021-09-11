# frozen_string_literal: true

module LineBot
  extend ActiveSupport::Concern

  def line_bot_client_info
    Line::Bot::Client.new do |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    end
  end
end
