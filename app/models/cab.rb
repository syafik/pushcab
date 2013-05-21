class Cab < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:login]

  attr_accessor :login
  attr_accessible :email, :password, :password_confirmation, :remember_me, :police_no, :phone_no, :status,
                  :username, :latitude, :longitude

  validates :username, :police_no, :phone_no, :email, :police_no, presence: true, uniqueness: true

  has_many :taxi_requests, dependent: :destroy

  geocoded_by :get_lat_lon   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates
  scope :order_by_username, order("username ASC")

  def self.not_requested_by_user(user)
    ids = TaxiRequest.where(user_id: user.id).pluck(:cab_id)
    ids.blank? ? self.all : self.where("id NOT IN (?)", ids)
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", {:value => login.downcase}]).first
    else
      where(conditions).first
    end
  end

  def get_lat_lon
    puts "get latitude and longitude"
  end

end
