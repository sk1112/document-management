#アプリケーション名  
*document-management  

#アプリケーション概要  
*文書の保管を登録し、廃棄するまでの期間管理するツール  

#URL  
*今後AWSにデプロイ予定  

#テスト用アカウント  
*ユーザー名：鈴木功成  
*メールアドレス：ks011012@gmail.com  
*パスワード：success1112  

#利用方法  
*管理したい文書をデータベースに登録  
*文書の保管場所や廃棄期間を指定して文書の情報を検索  
*文書の詳細情報を確認  
*廃棄が完了した文書や保管対象外となった文書をデータベースから削除  

#目指した課題解決  
*自治体や企業における文書の保管・廃棄業務をデータベースで管理することにより、文書の保管場所や廃棄年月日を抽出する時間を短縮して業務効率化を図る。    

#要件定義  
*文書登録機能  
*文書検索機能(ワード検索、条件指定検索)  
*ユーザー管理機能(ユーザー登録、ログイン、ログアウト)  
*文書一覧表示機能  
*文書詳細表示機能  
*文書編集機能  
*文書削除機能  
*文書廃棄期限残日数表示機能  

#データベース設計  

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

#ER図  
*https://gyazo.com/513ebea98138b38410639d866d916445  