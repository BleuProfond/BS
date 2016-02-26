class Project < ActiveRecord::Base 
  belongs_to :user
  has_many :comments

  validates :project_name, presence: true, length: {maximum: 30}
  validates :project_idea, presence: true, length: {maximum: 30}
  validates :project_problem, presence: true, length: {maximum: 50}
end 

