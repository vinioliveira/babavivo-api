class AddFildsToChampionship < ActiveRecord::Migration
  def change
    add_column :championships, :place, :string
    add_column :championships, :outfield_players, :integer
    add_column :championships, :type_teams, :string
  end
end
