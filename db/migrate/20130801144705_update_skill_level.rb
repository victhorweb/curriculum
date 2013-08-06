class UpdateSkillLevel < ActiveRecord::Migration
  def up
    add_column :skill_levels, :vacant_id, :integer
  end

  def down
  end
end
