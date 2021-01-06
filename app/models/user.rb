class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :documents, dependent: :destroy

  validates :email, uniqueness: { case_sensitive: false }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze, message: 'は半角英数字です', allow_blank: true },
                       on: :update, allow_blank: true
  with_options presence: true do
    validates :name, length: { maximum: 8, message: '8文字以内で入力してください', allow_blank: true }
    validates :password_confirmation, on: :update, allow_blank: true
    validates :department
  end
end
