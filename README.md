# README

# 実装内容
- 西が丘競技場のイベント情報を通知するLineBotを作成した
- herokuにてデプロイ中(warm-reaches-34234)

## 通知している内容
- 【毎日7時に実行】試合情報のスクレイピング&試合情報が追加されたらline通知
- 【毎月1日に実行】今月の試合日程をline通知

## その他
- herokuのアドオン機能で、定期実行を実施
- line通知はLineメッセンジャーを使用

## 参考
- https://developers.line.biz/console/
- https://developers.line.biz/ja/reference/messaging-api/#send-push-message
- https://qiita.com/natsukingdom-yamaguchi/items/e84dffdd90d7f5ef8224
- https://reasonable-code.com/heroku-cron/
