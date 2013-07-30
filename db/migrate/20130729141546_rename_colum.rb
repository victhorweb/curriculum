class RenameColum < ActiveRecord::Migration
  def up
  	rename_column :vacants,:sector_id,:sector_id
  end

  def down
  end
end
