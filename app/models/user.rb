class User < ActiveRecord::Base 
  has_many :projects
  has_many :comments

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
end 