class AddColumPerson < ActiveRecord::Migration
  def up
      add_column :people, :facebook, :string
  end

  def down
      remove_column :people, :facebook
  end
end
