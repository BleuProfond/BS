require 'faker'

# Create main user
user = User.create!(
  name: 'Bob',
  email: 'bob@example.com',
  password: '1234',
)

user = User.create!(
  name: 'Tom',
  email: 'tom@gmail.com',
  password: '12345'
)

project = Project.create!(
  project_name: 'Super Clothes',
  project_idea: 'I want pants that fly',
  project_problem: 'They won''t fly',
  user_id: '1',
  tags: "clothes, fly, pants"
  )

project = Project.create!(
  project_name: 'Cookie Monster',
  project_idea: 'Where can I find more cookies?',
  project_problem: 'Can''t stop eating cookies please help!',
  user_id: '2',
  tags: "cookie, eating, monster"
  )

project = Project.create!(
  project_name: 'Gaming Addiction',
  project_idea: 'Games to play while im sleeping.',
  project_problem: 'Non-stop gaming 24/7. What do?',
  user_id: '2',
  tags: "game, sleep, addiction"
  )