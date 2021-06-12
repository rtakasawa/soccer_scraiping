require 'open-uri'
require 'nokogiri'

class Nishigaoka < ApplicationRecord
  def self.scraiping
    # 西が丘競技場のイベント情報URL
    url = 'https://www.jpnsport.go.jp/hpsc/facility/nishigaoka/tabid/1437/Default.aspx'
    html = URI.open(url).read # htmlの取得
    doc = Nokogiri::HTML.parse(html)

    # 当月のイベント情報を入れる配列
    array = []
    doc.css('#dnn_ctr2311_Event_grdPresentMonth td').each do |td|
      # stripで前後の空白を除去
      array.push(td.text.strip)
    end

    # 日付と試合内容のkey,値のペアにしてハッシュ化
    match_info = Hash[*array]
    # 試合日をDate型に変換
    match_info.transform_keys! { |k| Date.strptime(k, '%Y/%m/%d') }
    match_info
  end
end
