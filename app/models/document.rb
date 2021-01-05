class Document < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :storage_period
  belongs_to :storage_location

  with_options presence: true do
    validates :title, length: { maximum: 10 }
    validates :jurisdiction_department
    validates :disposal_date
    validates :user_id
  end

  with_options numericality: { other_than: 1, message: 'を選択してください' } do
    validates :category_id
    validates :storage_period_id
    validates :storage_location_id
  end
end
