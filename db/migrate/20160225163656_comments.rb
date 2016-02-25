class Comments < ActiveRecord::Migration
  def change
  	create_table :comments do |t|
  		t.references :user
  		t.references :project
      t.text :comments
      t.timestamps null: false
    end
  end
end
