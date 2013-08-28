class UpdateAvaliable < ActiveRecord::Migration
  def up
    add_column :avaliables, :vacant_id, :integer
  end

end
