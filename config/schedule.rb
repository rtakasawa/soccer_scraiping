# ローカルでのwhenever練習用：本番では使用しない

# 出力先のログファイルを指定
set :output, 'log/crontab.log'
# ジョブの実行環境の指定
set :enviroment, :production

every 1.day, at: '11:40 am' do
  runner "Nishigaoka.scraiping"
end

every 1.day, at: '11:55 am' do
  rake "push_line:this_month_match_info"
end
