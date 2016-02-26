class User < ActiveRecord::Base 
  has_many :projects
  has_many :comments

  validates :name, presence: true, length: {maximum: 30}
  validates :email, presence: true, length: {maximum: 30}
  validates :password, presence: true, length: {minimum: 4}
end 