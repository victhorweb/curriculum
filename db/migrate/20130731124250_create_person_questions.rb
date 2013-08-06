class CreatePersonQuestions < ActiveRecord::Migration
  def change
    create_table :person_questions do |t|

      t.timestamps
    end
  end
end
