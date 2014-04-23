class CreateWildfires < ActiveRecord::Migration
  def change
    create_table :wildfires do |t|
      t.string :name
      t.date :happened
      t.string :death_toll
      t.string :acres_burned

      t.timestamps
    end
  end
end
