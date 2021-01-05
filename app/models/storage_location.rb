class StorageLocation < ActiveHash::Base
  self.data = [
    { id: 1, name: 'リストから選択してください' },
    { id: 2, name: '第1文書保管庫' },
    { id: 3, name: '第2文書保管庫' },
    { id: 4, name: '第3文書保管庫' },
    { id: 5, name: '第4文書保管庫' },
    { id: 6, name: '第5文書保管庫' }
  ]

  include ActiveHash::Associations
  has_many :documents
end
