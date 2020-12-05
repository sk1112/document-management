class Document < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :storage_period
  belongs_to :user

  with_options presence: true do
    validates :title, length: { maximum: 16 }
    validates :jurisdiction_department
    validates :storage_location
    validates :disposal_date
    validates :user_id
  end
  with_options numericality: { other_than: 1, message: 'を選択してください' } do
    validates :category_id
    validates :storage_period_id
  end
end
