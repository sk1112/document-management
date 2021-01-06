# アプリケーション名  
## document-management  

# アプリケーションの概要  
## 文書の保管や廃棄に関する業務を管理するアプリケーション  

# 目指した課題解決  
## 業務で文書を大量に使用する自治体や一部の企業を対象に、文書の保管・廃棄業務に関する情報をデータベースで管理することにより、文書の保管場所や廃棄対象の文書を探し出す時間と労力を削減して業務効率化を図ることを目指しました。  

# 制作の背景  
## 文書の保管・廃棄業務に時間を浪費していた前職(市役所職員)での経験から効率良く文書の保管場所と廃棄期限を把握することができるツールを利用することで、文書の保管・廃棄業務に要する時間と労力の削減が期待できると考えました。  

# 工夫した点  
## 登録した文書の情報を探しやすくするために、文書の所管部署や廃棄年月日などの条件が指定可能な検索機能を実装しました。  
## 廃棄期限までの具体的な日数を知りたい時のために、廃棄期限残日数をカウントダウン形式で表示する機能をJavaScriptで実装しました。

# 要件定義  
## 文書登録機能  
## 文書検索機能(条件指定検索)  
## ユーザー管理機能(ユーザー登録・情報編集・削除、ログイン、ログアウト)  
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

# アプリケーション使用方法  
## 初期画面  
### [![Image from Gyazo](https://i.gyazo.com/45e1e896b9064348fb1e5dc0c295e8de.png)](https://gyazo.com/45e1e896b9064348fb1e5dc0c295e8de  
## 上記テスト用アカウントでログイン  
###  [![Image from Gyazo](https://i.gyazo.com/3d84dc3aa59dd04704664999b13c887f.gif)](https://gyazo.com/3d84dc3aa59dd04704664999b13c887f)  
## 管理対象の文書を登録  
### [![Image from Gyazo](https://i.gyazo.com/a4b9db03d5f7709456698346f01d082f.gif)](https://gyazo.com/a4b9db03d5f7709456698346f01d082f)  
## 登録した文書の詳細を確認  
### [![Image from Gyazo](https://i.gyazo.com/e6afd619add20158b4cf27497ff121c9.gif)](https://gyazo.com/e6afd619add20158b4cf27497ff121c9)  
## 文書の所管部署や廃棄年月日を指定して文書の情報を検索  
### [![Image from Gyazo](https://i.gyazo.com/51ab71cce61bb566abc993b4d1d65172.gif)](https://gyazo.com/51ab71cce61bb566abc993b4d1d65172)  
## 必要に応じて廃棄期限残日数を確認  
### [![Image from Gyazo](https://i.gyazo.com/e1eb4feaa65fd5346dcf849e81b44809.gif)](https://gyazo.com/e1eb4feaa65fd5346dcf849e81b44809)  
## 廃棄が完了した文書や保管対象外となった文書を削除  
### [![Image from Gyazo](https://i.gyazo.com/72e0ee2d268183f599a1110588f08662.gif)](https://gyazo.com/72e0ee2d268183f599a1110588f08662  


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
$ git clone https://github.com/sk1112/document-management.git  
$ cd document-management  
$ bundle install  
$ rails db:create  
$ rails db:migrate  
$ rails s  
→http://localhost:3000  

# 開発環境  
*HTML5  
*CSS3  
*JavaScript  
*Ruby  
*Ruby on Rails  
*MySQL  
*Github  
*AWS  
*Visual Studio Code  