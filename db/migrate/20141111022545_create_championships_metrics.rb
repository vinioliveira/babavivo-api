class CreateChampionshipsMetrics < ActiveRecord::Migration
  def change
    create_table :championships_metrics do |t|
      t.belongs_to :championship
      t.belongs_to :metric
    end
  end
end
