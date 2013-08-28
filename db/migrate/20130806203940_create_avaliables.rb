class CreateAvaliables < ActiveRecord::Migration
  def change
    create_table :avaliables do |t|
      t.integer :person_id
      t.integer :skill_id
      t.integer :level_id

      t.timestamps
    end
  end
end
