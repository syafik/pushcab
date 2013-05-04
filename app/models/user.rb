class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :timeoutable, :token_authenticatable, :confirmable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :confirmed_at,
    :phone_no, :username
  
  validates :phone_no, presence: true, uniqueness: true
end
