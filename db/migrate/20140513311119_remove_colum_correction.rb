class RemoveColumCorrection < ActiveRecord::Migration
  def up
     remove_column :corrections , :avaliable_id
  end

  def down
    add_column :corrections , :avaliable_id, :integer
  end
end
