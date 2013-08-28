  class AddColunmSkill < ActiveRecord::Migration
    def up
      add_column :skills, :score, :float
    end
  end