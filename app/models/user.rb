class User < ActiveRecord::Base
  has_many :workouts
  has_secure_password
  
  def slug 

  end 

  def find_by_slug(slug)

  end 
end 
