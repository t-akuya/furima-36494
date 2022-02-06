class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: {maximum: 40}
  validates :birth_day, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}

  with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]/ } do
    validates :last_name, presence: true
    validates :first_name, presence: true
  end

  with_options format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/ } do                       
    validates :last_name_kana, presence: true
    validates :first_name_kana, presence: true      
  end
end