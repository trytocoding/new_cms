class User < ActiveRecord::Base
  validates :password, length: { minimum: 5 }	
  validates :login, presence: true, uniqueness: true, length: {maximum: 12}

end
