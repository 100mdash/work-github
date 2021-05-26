# ながのCAKE　ECサイト

 長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト開発。
元々近隣住民が顧客だったが、昨年始めたInstagramから人気となり、全国から注文が来るようになった。
InstagramのDMやメールで通販の注文を受けていたが、情報管理が煩雑になってきたため、
管理機能を含んだ通販サイトを開設しようと思い至った。

* 通販では注文に応じて製作する受注生産型としている。
* 現在通販での注文量は十分に対応可能な量のため、1日の受注量に制限は設けない。
* 送料は1配送につき全国一律800円。
* 友人や家族へのプレゼントなど、注文者の住所以外にも商品を発送できる。
* 支払方法はクレジットカード、銀行振込から選択できる

# 開発環境
AWS Cloud9 Ruby ver. 2.6.3 Ruby on rails ver. 5.2.5

# Gem
* gem 'devise'
* gem 'kaminari','~> 1.2.1'
* gem 'bootstrap', '~> 4.5'
* gem 'jquery-rails'
* gem "refile", require: "refile/rails", github: 'manfe/refile'
* gem "refile-mini_magick"
* gem 'font-awesome-sass', '~> 5.13'
* gem 'rails-i18n'

# 環境構築/使用方法
* git clone git@github.com:100mdash/work-github.git(SSH)
* cd work-github
* rails db:migrate
* rails db:seed
* bundle install

# ログインについて
  customer（顧客）側は新規登録行っていだだければ使用できます。
  admin（管理人）側は以下の手順をご覧ください。<br>
 * ログアウトしているのを確認後、ログイン画面へ移動してください。
 * URLにて/customers/sign_inの部分を/admins/sign_inへ直接入力し変更してださい。
 * 移動後のログイン画面にて　メールアドレス：[test@test.com]  パスワード：[111111] を入力することでadmin（管理者側）へログイン可能です。<br>
 
 　admin(管理者)のメールアドレス・パスワードを変更の際は、seeds.rbにて変更後, rails db:seedを行う。もしくはコンソール機能を使用して変更をお願いします。
 
# 設計書
要件定義署<br>
ER図<br>
アプリケーション詳細設計<br>

# 作成者
　takumi yuuta たぐっちゃん　asuka
