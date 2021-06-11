require 'mechanize'

class Nishigaoka < ApplicationRecord
  def self.scraiping
    agent = Mechanize.new


    page = agent.get('https://www.jpnsport.go.jp/hpsc/facility/nishigaoka/tabid/1437/Default.aspx').search('//*[@id="dnn_ctr2311_Event_grdPresentMonth"]').inner_text
    page.gsub!(/(\r\n|\r|\n|\f|\t)/, "")
    a=page.split(" ")
    i.match(/\d{4}\/\d{2}\/\d{2}/)
    a.delete("日程")




    # 西が丘競技場の試合情報
    target_url = 'https://spocale.com/places/614'

    # 試合日のxpath
    match_day_path = '//*[@id="infinite-scroll"]/div/div[1]/div/span'

    # 試合内容のxpath
    team_path = '//*[@id="infinite-scroll"]/div/div[2]/a/div[3]'

    match_total_info = []
    while true
      match_day_info = agent.get('https://spocale.com/places/614').search(match_day_path)
      return unless match_day_info.nil?

      match_day_info = agent.get('https://spocale.com/places/614').search('//*[@id="infinite-scroll"]/div/')








    end








  end
end
