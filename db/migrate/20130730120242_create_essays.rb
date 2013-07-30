class CreateEssays < ActiveRecord::Migration
  def change
    create_table :essays do |t|
      t.string :question
      t.integer :skill
      t.integer :level
      t.string :reply

      t.timestamps
    end
  end
end
