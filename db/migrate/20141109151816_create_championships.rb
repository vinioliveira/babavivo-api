class CreateChampionships < ActiveRecord::Migration
  def change
    create_table :championships do |t|
      t.string :name
      t.integer :day_of_week
      t.references :creator, index: true
      t.time :start_time
      t.datetime :draw_date

      t.timestamps
    end
  end
end
