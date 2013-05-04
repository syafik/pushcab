class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :timeoutable, :token_authenticatable, :confirmable,
         :authentication_keys => [:login]

  attr_accessor :login
  attr_accessible :email, :password, :password_confirmation, :remember_me, :confirmed_at,
    :phone_no, :username, :login
  
  validates :phone_no, :username, presence: true, uniqueness: true

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

end
