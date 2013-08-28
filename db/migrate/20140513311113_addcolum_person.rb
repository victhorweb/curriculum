class AddcolumPerson < ActiveRecord::Migration
  def up
      add_column :people, :status_id, :integer
  end

  def down
  end
end
