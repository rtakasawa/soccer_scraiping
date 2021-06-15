namespace :push_line do
  desc "push_line"
  task push_line_message_morning: :environment do # 以下にpush機能のタスクを書く。
    message = {
      type: 'text',
      text: 'Hi ryosuke'
    }
    client = Line::Bot::Client.new do |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    end

    response = client.push_message(ENV["LINE_CHANNEL_USER_ID"], message)
    p response
  end
end
