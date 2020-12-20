# アプリケーション名  
## document-management  

# アプリケーション概要  
## 文書の保管場所や廃棄年月日を管理するツール  

# 目指した課題解決  
## 業務で文書を大量に使用する自治体や一部の企業を対象に、文書の保管・廃棄業務に関する情報をデータベースで管理することにより、文書の保管場所や廃棄対象の文書を探し出す時間と労力を削減して業務効率化を図ることを目指しました。  

# 制作の背景  
## 文書の保管・廃棄業務に時間を浪費していた前職(市役所職員)での経験から効率良く文書の保管場所と廃棄期限を把握することができるツールを利用することで、文書の保管・廃棄業務に要する時間と労力の削減が期待できると考えました。  

# 工夫した点  
## 登録した文書の情報を探しやすくするために、所管文書や廃棄期限などの条件を指定して検索することができるようにしました。  
## 廃棄期限までの具体的な日数を知りたい時のために、廃棄期限残日数をカウントダウン形式で表示する機能をJavaScriptで実装しました。

# 要件定義  
## 文書登録機能  
## 文書検索機能(ワード検索、条件指定検索)  
## ユーザー管理機能(ユーザー登録・編集・削除、ログイン、ログアウト)  
## 文書一覧表示機能  
## 文書詳細表示機能  
## 文書編集機能  
## 文書削除機能  
## 文書廃棄期限残日数表示機能  

# アプリケーションURL  
## https://document-mangement-01.herokuapp.com/  

# テスト用アカウント  
## ユーザー名：テストユーザー  
## メールアドレス：test@gmail.com  
## パスワード：success1112  

# アプリケーション使用方法  
## 上記テスト用アカウントでログイン  
###  [![Image from Gyazo](https://i.gyazo.com/d3c06e606b79bed55ffb606ce966d696.gif)](https://gyazo.com/d3c06e606b79bed55ffb606ce966d696)  
## 管理したい文書をデータベースに登録  
### [![Image from Gyazo](https://i.gyazo.com/5e6a9dfda2716e891bb62cddac8d8638.gif)](https://gyazo.com/5e6a9dfda2716e891bb62cddac8d8638)  
## 文書の保管場所や廃棄年月日を指定して文書の情報を検索  
### [![Image from Gyazo](https://i.gyazo.com/a694df14e530270c6b25d936def98402.gif)](https://gyazo.com/a694df14e530270c6b25d936def98402)  
## 登録した文書の詳細を確認  
### [![Image from Gyazo](https://i.gyazo.com/86a5a723ef143e4f40fadb96a3c57042.gif)](https://gyazo.com/86a5a723ef143e4f40fadb96a3c57042)  
## 必要に応じて廃棄期限残日数を確認  
### [![Image from Gyazo](https://i.gyazo.com/a56e3a8407d0eebf03723525e83c5f50.gif)](https://gyazo.com/a56e3a8407d0eebf03723525e83c5f50)  
## 廃棄が完了した文書や保管対象外となった文書をデータベースから削除  
### [![Image from Gyazo](https://i.gyazo.com/ca34c8bb24505ea325771d1245743cd5.gif)](https://gyazo.com/ca34c8bb24505ea325771d1245743cd5)  


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
$ git clone https://github.com/sk1112/document-management.git  
$ cd document-management  
$ bundle install  
$ rails db:create  
$ rails db:migrate  
$ rails s  
→http://localhost:3000  

# 開発環境  
## Ruby/Ruby on Rails/MySQL/JavaScript/Github/Heroku/Visual Studio Code  