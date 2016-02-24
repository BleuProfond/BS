class AddProject < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name 
      t.string :people_involved 
      t.string :project_idea 
      t.string :project_problem 
      t.string :project_solution 
      t.timestamps null: false 
    end 
  end
end
