class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: 'リストから選択してください' },
    { id: 2, name: '個人情報' },
    { id: 3, name: '報告書' },
    { id: 4, name: '企画書' },
    { id: 5, name: '稟議書' },
    { id: 6, name: '届け出書' },
    { id: 7, name: '通知' },
    { id: 8, name: '依頼書' },
    { id: 9, name: '回覧板' },
    { id: 10, name: '伝言メモ' },
    { id: 11, name: 'その他' }
 ]

  include ActiveHash::Associations
  has_many :documents
  
end