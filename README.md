# アプリケーション名  
## document-management(文書保管・廃棄管理システム)  
###  [![Image from Gyazo](https://i.gyazo.com/df3bb33496a06ee6a024bc583f4b9cec.jpg)](https://gyazo.com/df3bb33496a06ee6a024bc583f4b9cec)

# アプリケーションの概要  
## 文書の保管場所や廃棄年月日を効率的に管理するアプリケーション  

# 開発環境  
* HTML5  
* CSS3  
* JavaScript  
* Ruby  
* Ruby on Rails  
* MySQL  
* Github  
* AWS  
* Visual Studio Code  

# 目指した課題解決  
## 業務で文書を大量に使用する自治体や一部の企業を対象に、文書の保管・廃棄業務に関する情報をデータベースで管理することにより、文書の保管場所や廃棄対象の文書を探し出す時間と労力を削減して業務効率化を図ることを目指しました。  

# 制作の背景  
## 文書の保管・廃棄業務に時間を浪費していた前職(市役所職員)での経験から効率良く文書の保管場所と廃棄期限を把握することができるツールを利用することで、文書の保管・廃棄業務に要する時間と労力の削減が期待できると考えました。  

# 工夫した点  
## 登録した文書の情報を探しやすくするために、文書の所管部署や廃棄年月日などの条件が指定可能な検索機能を実装しました。  
## 廃棄期限までの具体的な日数を知りたい時のために、廃棄期限残日数をカウントダウン形式で表示する機能をJavaScriptで実装しました。

# 要件定義  
## ユーザー管理機能(ユーザー登録・情報編集・削除、ログイン、ログアウト)  
## 文書登録機能  
## エラーメッセージ日本語表示機能  
## 文書検索機能(条件指定検索)  
## 文書一覧表示機能  
## 文書詳細表示機能  
## 文書編集機能  
## 文書削除機能  
## 文書廃棄期限残日数表示機能  

# アプリケーションURL  
## http://54.249.148.123/

# Basic認証  
## Basic認証ID：success  
## Basic認証PASS：31793  

# テスト用アカウント  
## ユーザー名：テストユーザー  
## メールアドレス：test@gmail.com  
## パスワード：success1112  

# アプリケーションの使用方法  
## 初期画面  
###  [![Image from Gyazo](https://i.gyazo.com/242ff98522de5ac35a3b62a1875fb8c3.png)](https://gyazo.com/242ff98522de5ac35a3b62a1875fb8c3)  
## 上記テスト用アカウントでログイン  
###  [![Image from Gyazo](https://i.gyazo.com/e9af656f3c71e53fd213b3f03412fea8.gif)](https://gyazo.com/e9af656f3c71e53fd213b3f03412fea8)  
## 管理対象の文書を登録  
###  [![Image from Gyazo](https://i.gyazo.com/a4b9db03d5f7709456698346f01d082f.gif)](https://gyazo.com/a4b9db03d5f7709456698346f01d082f)  
## エラーメッセージの日本語表示  
###  [![Image from Gyazo](https://i.gyazo.com/97d2b06d3dd0bae8a6c5981049496d91.gif)](https://gyazo.com/97d2b06d3dd0bae8a6c5981049496d91)  
## 登録した文書の詳細を確認  
###  [![Image from Gyazo](https://i.gyazo.com/e6afd619add20158b4cf27497ff121c9.gif)](https://gyazo.com/e6afd619add20158b4cf27497ff121c9)  
## 文書の所管部署や廃棄年月日を指定して文書の情報を検索  
###  [![Image from Gyazo](https://i.gyazo.com/84685fd135547292f3cfc525a61a8b59.gif)](https://gyazo.com/84685fd135547292f3cfc525a61a8b59)  
###  [![Image from Gyazo](https://i.gyazo.com/7f462e8fa9526d1e25ec0aaa09dab320.gif)](https://gyazo.com/7f462e8fa9526d1e25ec0aaa09dab320)  
## 必要に応じて廃棄期限残日数を確認  
###  [![Image from Gyazo](https://i.gyazo.com/e1eb4feaa65fd5346dcf849e81b44809.gif)](https://gyazo.com/e1eb4feaa65fd5346dcf849e81b44809)  
## 廃棄が完了した文書や保管対象外となった文書を削除  
###  [![Image from Gyazo](https://i.gyazo.com/72e0ee2d268183f599a1110588f08662.gif)](https://gyazo.com/72e0ee2d268183f599a1110588f08662)  


# 今後実装したい機能  
## データ削除時などの確認ダイアログ表示機能  

# データベース設計  
## users テーブル  

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | NOT NULL    |
| email              | string | NOT NULL    |
| encrypted_password | string | NOT NULL    |
| department         | string | NOT NULL    |

### Association  

- has_many :documents  

## documents テーブル  

| Column                   | Type        | Options                      |
| ------------------------ | ----------- | --------------------------- |
| title                    | string      | NOT NULL                    |
| jurisdiction_department  | string      | NOT NULL                    |
| category_id              | integer     | NOT NULL                    |
| storage_period_id        | integer     | NOT NULL                    |
| storage_location         | string      | NOT NULL                    |
| disposal_date            | date        | NOT NULL                    |
| user_id                  | references  | NOT NULL, foreign_key: true |

### Association  

- belongs_to :users
- belongs_to :category
- belongs_to :storage_period

# ER図  
## [![Image from Gyazo](https://i.gyazo.com/002d6ace732c8e6eca7fdeda399ee0e6.png)](https://gyazo.com/002d6ace732c8e6eca7fdeda399ee0e6)  

# ローカル環境での動作方法  
* % git clone https://github.com/sk1112/document-management.git  
* % cd document-management  
* % bundle install  
* % rails db:create  
* % rails db:migrate  
* % rails s  
* →http://localhost:3000  