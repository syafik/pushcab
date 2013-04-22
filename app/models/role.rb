class Role < ActiveRecord::Base
  attr_accessible :description, :name
  
  validates :name, presence: true
  
  has_many :users
end
