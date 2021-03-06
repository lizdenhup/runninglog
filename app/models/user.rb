class User < ActiveRecord::Base
  has_many :workouts
  has_secure_password
  validates_presence_of :username, on: :create
  validates_uniqueness_of :username, on: :create
  validates_presence_of :email, on: :create
  validates_uniqueness_of :email, on: :create
  validates_presence_of :password, on: :create 
  
  def slug 
    username.downcase.gsub(" ","-")
  end 

  def self.find_by_slug(slug)
    User.all.find { |user| user.slug == slug }
  end 
  
end 
