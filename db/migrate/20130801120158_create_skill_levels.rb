class CreateSkillLevels < ActiveRecord::Migration
  def change
    create_table :skill_levels do |t|
       t.integer :person_id
      t.integer :skill_id
      t.integer :level_id
      t.timestamps
    end
  end
end
