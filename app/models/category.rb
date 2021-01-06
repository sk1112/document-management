class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: 'リストから選択してください' },
    { id: 2, name: '個人情報' },
    { id: 3, name: '報告書' },
    { id: 4, name: '企画書' },
    { id: 5, name: '計画書' },
    { id: 6, name: '提案書' },
    { id: 7, name: '契約書' },
    { id: 8, name: '管理簿' },
    { id: 9, name: '議事録' },
    { id: 10, name: '記録' },
    { id: 11, name: '通知' },
    { id: 12, name: '届出' },
    { id: 13, name: '指示書' },
    { id: 14, name: '依頼書' },
    { id: 15, name: 'リスト' },
    { id: 16, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :documents
end
