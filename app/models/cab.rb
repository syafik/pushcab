class Cab < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:login]

  attr_accessor :login
  attr_accessible :email, :password, :password_confirmation, :remember_me, :police_no, :phone_no, :status,
                  :username, :latitude, :longitude

  validates :username, :police_no, :phone_no, :email, :police_no, presence: true, uniqueness: true

  has_many :taxi_requests, dependent: :destroy

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", {:value => login.downcase}]).first
    else
      where(conditions).first
    end
  end

end
