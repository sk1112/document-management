class StoragePeriod < ActiveHash::Base
self.data = [
    { id: 1, name: 'リストから選択してください' },
    { id: 2, name: '1年' },
    { id: 3, name: '2年' },
    { id: 4, name: '3年' },
    { id: 5, name: '4年' },
    { id: 6, name: '5年' },
    { id: 7, name: '6年' },
    { id: 8, name: '7年' },
    { id: 9, name: '8年' },
    { id: 10, name: '9年' },
    { id: 11, name: '10年' },
    { id: 12, name: '11年' },
    { id: 13, name: '12年' },
    { id: 14, name: '13年' },
    { id: 15, name: '14年' },
    { id: 16, name: '15年' },
    { id: 17, name: '16年' },
    { id: 18, name: '17年' },
    { id: 19, name: '18年' },
    { id: 20, name: '19年' },
    { id: 21, name: '20年' },
    { id: 22, name: '21年' },
    { id: 23, name: '22年' },
    { id: 24, name: '23年' },
    { id: 25, name: '24年' },
    { id: 26, name: '25年' },
    { id: 27, name: '26年' },
    { id: 28, name: '27年' },
    { id: 29, name: '28年' },
    { id: 30, name: '29年' },
    { id: 31, name: '30年' },
    { id: 32, name: 'なし' }
 ]

  include ActiveHash::Associations
  has_many :documents
  
end