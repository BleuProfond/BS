require 'faker'

# Create main user
user = User.create!(
  name: 'Bob',
  email: 'bob@example.com',
  password: '1234'
)

user = User.create!(
  name: 'Tom',
  email: 'tom@gmail.com',
  password: '12345'
)

# 4.times do
#   project_name = Faker::Book.title
#   project_idea = Faker::Company.bs
#   project_problem = Faker::Lorem.sentence
#   user.projects.create!(
#     project_name: project_name,
#     project_idea: project_idea,
#     project_problem: project_problem
#   )
# end

project = Project.create!(
  project_name: 'Super Clothes',
  project_idea: 'I want pants that fly',
  project_problem: 'They won''t fly',
  user_id: '1'
  )
project = Project.create!(
  project_name: 'Cookie Monster',
  project_idea: 'Where can I find more cookies?',
  project_problem: 'Can''t stop eating cookies please help!',
  user_id: '2'
  )
project = Project.create!(
  project_name: 'Gaming Addition',
  project_idea: 'Games to play while im sleeping.',
  project_problem: 'Non-stop gaming 24/7. What do?',
  user_id: '2'
  )