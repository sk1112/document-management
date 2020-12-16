class StoragePeriod < ActiveHash::Base
  self.data = [
    { id: 1, name: 'リストから選択してください' },
    { id: 2, name: 'なし' },
    { id: 3, name: '1年' },
    { id: 4, name: '2年' },
    { id: 5, name: '3年' },
    { id: 6, name: '4年' },
    { id: 7, name: '5年' },
    { id: 8, name: '6年' },
    { id: 9, name: '7年' },
    { id: 10, name: '8年' },
    { id: 11, name: '9年' },
    { id: 12, name: '10年' },
    { id: 13, name: '10年以上' }
  ]

  include ActiveHash::Associations
  has_many :documents
end
