class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :hookup_id
      t.string :avatar
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
