require 'faker'

# Create main user
user = User.create!(
  name: 'Bob',
  email: 'bob@example.com',
  password: '1234'
)

4.times do
  project_name = Faker::Book.title
  project_idea = Faker::Company.bs
  project_problem = Faker::Lorem.sentence
  user.projects.create!(
    project_name: project_name,
    project_idea: project_idea,
    project_problem: project_problem
  )
end