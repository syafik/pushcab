class Driver < ActiveRecord::Base
  attr_accessible :email, :password_salt, :password_hash, :username, 
                  :phone_no, :police_no, :password
  
  attr_accessor :password
  
  before_save :encrypt_password
  
  validates :password, confirmation: true
  validates :password, presence: true, on: :create
  validates :username, :police_no, :phone_no, :email, :police_no, presence: true, uniqueness: true
  validates :email, format: {with: /^.+@.+$/}
  
  def self.authenticate(email, password)
    driver = find_by_email(email)
    if driver && driver.password_hash == BCrypt::Engine.hash_secret(password, driver.password_salt)
      driver
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
