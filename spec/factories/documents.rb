FactoryBot.define do
  factory :document do
    title                    { '顧客リスト' }
    jurisdiction_department  { '営業部' }
    category_id              { 2 }
    storage_period_id        { 4 }
    storage_location         { '第一倉庫' }
    disposal_date            { '2024-04-01' }
    user_id                  { FactoryBot.create(:user).id }
  end
end
