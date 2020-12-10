class Document < ApplicationRecord
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :storage_period

  with_options presence: true do
    validates :title, length: { maximum: 10 }
    validates :jurisdiction_department
    validates :storage_location
    validates :user_id
  end
  with_options numericality: { other_than: 1, message: 'を選択してください' } do
    validates :category_id
    validates :storage_period_id
  end

  scope :search, -> (search_params) do 
    return if search_params.blank? 

    title_like(search_params[:title])
      .jurisdiction_department_like(search_params[:jurisdiction_department])
      .disposal_date_from(search_params[:disposal_date_from])
      .disposal_date_to(search_params[:disposal_date_to])
      .storage_location_like(search_params[:storage_location]) 
  end

  scope :title_like, -> (title) { where('title LIKE ?', "%#{title}%") if title.present? } 
  scope :jurisdiction_department_like, -> (jurisdiction_department) { where('jurisdiction_department LIKE ?', "%#{jurisdiction_department}%") if jurisdiction_department.present? } 
  scope :disposal_date_from, -> (from) { where('? <= disposal_date', from) if from.present? }
  scope :disposal_date_to, -> (to) { where('disposal_date <= ?', to) if to.present? }
  scope :storage_location_like, -> (storage_location) { where('storage_location LIKE ?', "%#{storage_location}%") if storage_location.present? }

end
