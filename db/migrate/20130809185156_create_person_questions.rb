class CreatePersonQuestions < ActiveRecord::Migration
  def change
    create_table :person_questions do |t|
      t.integer :person_id
      t.integer :essay_id
      t.integer :vacant_id
      t.string :replay

      t.timestamps
    end
  end
end
