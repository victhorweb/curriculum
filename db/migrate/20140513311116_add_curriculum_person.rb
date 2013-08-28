class AddCurriculumPerson < ActiveRecord::Migration
  def self.up
    add_attachment :people, :curriculum
  end

  def self.down
    remove_attachment :people, :curriculum
  end
end
