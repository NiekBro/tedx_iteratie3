class CreateHookups < ActiveRecord::Migration
  def change
    create_table :hookups do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
