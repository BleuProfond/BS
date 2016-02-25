class RemovePeopleInvolved < ActiveRecord::Migration
  def change
    remove_column :projects, :people_involved
  end
end
