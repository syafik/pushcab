class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :timeoutable, :token_authenticatable, :confirmable

  attr_accessible :email, :password, :password_confirmation, :remember_me, 
    :phone_no
  
  validates :phone_no, presence: true, uniqueness: true
end
