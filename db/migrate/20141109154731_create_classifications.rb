class CreateClassifications < ActiveRecord::Migration
  def change
    create_table :classifications do |t|
      t.references :user
      t.references :championship
      t.references :metric
      t.timestamps
    end
  end
end
