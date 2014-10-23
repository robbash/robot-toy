class CreateRobots < ActiveRecord::Migration
  def change
    create_table :robots do |t|
      t.integer :pos_x
      t.integer :pos_y
      t.integer :facing

      t.timestamps
    end
  end
end
