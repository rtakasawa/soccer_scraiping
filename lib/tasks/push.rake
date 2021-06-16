namespace :push_line do
  desc "push_line"

  # 今月の試合日程をline通知
  task this_month_match_info: :environment do # 以下にpush機能のタスクを書く。

    # all_monthをDate.todayに適用すると、今月の年月日データを取得できる。
    this_month = Date.today.all_month

    # 今月の試合日程を抽出
    this_month_match_info = Nishigaoka.where(match_day: this_month).select(:match_day, :contents)

    # line送信用にthis_month_match_infoを文字列に整える
    this_month_push_message = this_month_match_info.map { |i|
      "■" << i.match_day.strftime("%Y/%m/%d(%a)") << "_" << i.contents << "\n"
    }.join

    message = {
      type: 'text',
      text: "【今月の試合日程】\n" << this_month_push_message
    }
    client = Line::Bot::Client.new do |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    end

    response = client.push_message(ENV["LINE_CHANNEL_USER_ID"], message)
    p response
  end
end
