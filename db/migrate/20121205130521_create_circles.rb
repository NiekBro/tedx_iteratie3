class CreateCircles < ActiveRecord::Migration
  def change
    create_table :circles do |t|
      t.string :unique_id
      t.string :circle_type
      t.timestamps
    end
  end
end
