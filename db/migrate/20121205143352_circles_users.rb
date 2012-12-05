class CirclesUsers < ActiveRecord::Migration
  def up
  	create_table :circles_users, :id => false do |t|
  		t.integer :user_id
  		t.integer :circle_id
  		t.references :user, :circle
  	end
  end

  def down
  	drop_table :circles_users
  end
end
