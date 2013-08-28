class AddcolunVacants < ActiveRecord::Migration
  def self.up
    add_attachment :vacants, :image
  end

  def self.down
    remove_attachment :vacants, :image
  end
end
