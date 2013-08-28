class CreateCorrections < ActiveRecord::Migration
  def change
    create_table :corrections do |t|
      t.integer :person_id
      t.integer :vacant_id
      t.integer :skill_id
      t.integer :level_id
      t.integer :number

      t.timestamps
    end
  end
end
