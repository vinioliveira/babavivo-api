class CreateChampionshipsUsers < ActiveRecord::Migration
  def change
    create_table :championships_users do |t|
      t.belongs_to :championship
      t.belongs_to :user
    end
  end
end
