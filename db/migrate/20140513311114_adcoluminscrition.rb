class Adcoluminscrition < ActiveRecord::Migration
  def up
      add_column :inscritions, :status_id, :integer
  end

  def down
      remove_column :inscritions, :status_id
  end
end
