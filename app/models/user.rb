class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable, omniauth_providers: [:google_oauth2]
			  
  acts_as_user :roles => [:admin]
  has_many :favorites
  has_many :comments
  has_many :ads, dependent: :destroy
  has_many :articles
  has_many :liked_articles, :through => :likes, :source => :article
  has_many :likes, dependent: :destroy
  has_one_attached :avatar

  def self.from_omniauth(access_token)
          data = access_token.info
          user = User.where(email: data['email']).first
          unless user
              user = User.create( email: data['email'], password: Devise.friendly_token[0,20])
          end
      user
  end

  def is_admin?
    return (self.roles_mask & 2) == 2
  end

  def set_admin
    self.roles_mask = (self.roles_mask | 2) 
    self.save
  end

  def unset_admin
    self.roles_mask = (self.roles_mask & 1) 
    self.save
  end

  def is_banned?
    return self.roles_mask  == 0
  end

  def is_user?
    return (self.roles_mask & 1) == 1
  end

  def set_user
  	self.roles_mask = (self.roles_mask | 1) 
  	self.save
  end

  def unset_user
  	self.roles_mask = 0 
  	self.save
  end

end
