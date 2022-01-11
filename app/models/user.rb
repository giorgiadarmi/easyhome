class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable, omniauth_providers: [:google_oauth2]
			  

  def self.from_omniauth(access_token)
          data = access_token.info
          user = User.where(email: data['email']).first
          unless user
              user = User.create( email: data['email'], password: Devise.friendly_token[0,20])
          end
      user
  end
  
  has_many :comments
  has_many :ads, dependent: :destroy
  has_many :articles
  has_many :liked_articles, :through => :likes, :source => :article
  has_many :favorite_ads, dependent: :destroy
  has_many :favorites, through: :favorite_ads, source: :ad, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  
end
