class RemoveSolutionColumnFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :project_solution
  end
end
