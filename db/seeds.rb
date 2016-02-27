require 'faker'

# Create main user
user1 = User.create!(
  name: 'Bob Bentley',
  email: 'bob@hotmail.com',
  password: '12345',
)

user2 = User.create!(
  name: 'Tom Harris',
  email: 'tom@gmail.com',
  password: '12345'
)

user3 = User.create!(
  name: 'Cindy Lou',
  email: 'cindy@yahoo.com',
  password: '12345'
)

project1 = Project.create!(
  project_name: 'Unstuck',
  project_idea: 'A site where people can collaborate on projects, facilitate new ideas and solve technical challenges.',
  project_problem: 'We want users to be able to create mind-maps for their projects.',
  user_id: User.find(1).id,
  tags: "brain, storm, solve"
)

project2 = Project.create!(
  project_name: 'MusicPad',
  project_idea: 'An online notepad for musical ideas.',
  project_problem: 'I need to figure out the best way to implement a software synthesizer for users to work with on a browser.',
  user_id: User.find(1).id,
  tags: "music, synth, notes"
)

project3 = Project.create!(
  project_name: 'Dungeon Blasters',
  project_idea: 'A game that combines dungeon-crawlers with Bomberman.',
  project_problem: 'I''m not sure what frameworks would be the most suited for making this kind of game.',
  user_id: User.find(2).id,
  tags: "game, dungeon, bomberman"
)

Comment1 = Comment.create!(
  user_id: User.find(3).id,
  project_id: Project.find(3).id,
  comments: "You can try making it on Rails using the Gosu gem for your graphics."
)

Comment2 = Comment.create!(
  user_id: User.find(2).id,
  project_id: Project.find(2).id,
  comments: "You will need to learn about websockets if you plan on trying to record live."
)

Comment3 = Comment.create!(
  user_id: User.find(3).id,
  project_id: Project.find(2).id,
  comments: "You should checkout a library for Ruby called midilib. It will help you save a performance as a midi file which you could apply synths to later."
)

Comment4 = Comment.create!(
  user_id: User.find(2).id,
  project_id: Project.find(1).id,
  comments: "You could implement the mind-map creation with Javascript. There are a couple API's available for making diagrams."
)