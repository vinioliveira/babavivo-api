class AddSkillsToUser < ActiveRecord::Migration
  def change
    add_column :users, :age, :integer
    add_column :users, :position, :string
  end
end
