FactoryBot.define do
  factory :user do
    name                  { 'test' }
    email                 { 'test@example' }
    password              { 'test0000' }
    password_confirmation { password }
    department            { '営業部' }
  end
end
