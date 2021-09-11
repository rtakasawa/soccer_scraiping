
namespace :push_line do
  desc "push_line"

  require './app/helpers/linebot_helper'
  include LinebotHelper

  # 【毎日7時に実行】試合情報のスクレイピング&試合情報が追加されたらline通知
  task scraiping_and_add_new_match: :environment do
    Nishigaoka.scraiping

    # 試合情報が追加されたらlineで通知する
    add_new_match_info = Nishigaoka.where('created_at >= ?', Time.zone.today)

    # 試合情報が追加されない場合は、通知処理は実行しない
    return unless add_new_match_info.present?

    # line送信用にadd_new_match_infoを文字列に整える
    push_messages = add_new_match_info.map { |i|
      "■" << i.match_day.strftime("%Y/%m/%d(%a)") << "_" << i.contents << "\n"
    }.join

    message = {
      type: 'text',
      text: "【追加されて試合日程】\n" << push_messages
    }

    client = line_bot_client_info

    response = client.push_message(ENV["LINE_CHANNEL_USER_ID"], message)
    p response
  end


  # 【毎月1日に実行】今月の試合日程をline通知
  task this_month_match_info: :environment do # 以下にpush機能のタスクを書く。

    # 月初に処理を実行する
    today = Date.today
    return if today == today.beginning_of_month

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

    client = line_bot_client_info

    response = client.push_message(ENV["LINE_CHANNEL_USER_ID"], message)
    p response
  end
end
