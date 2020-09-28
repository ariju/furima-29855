class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :first_name
    validates :last_name
    validates :first_name_kana
    validates :last_name_kana               #大文字と小文字正規表現は＠とかの
  end
                                        #全角半角正規表現全角ひらがな、全角カタカナ、漢字（鬼車）
  with_options format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: "full-width characters."} do
    validates :first_name 
    validates :last_name 
  end

  with_options format: {with: /\A[ぁ-んァ-ヶー－]+\z/, message: "full-width characters."} do
    validates :first_name_kana 
    validates :last_name_kana 
  end

  with_options format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i, message: "full-width characters."} do
    validates :password
  end
    
end

