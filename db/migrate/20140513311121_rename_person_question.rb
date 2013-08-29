class RenamePersonQuestion < ActiveRecord::Migration
  def up
    rename_column :corrections,:person_questions_id, :person_question_id
   end

  def down
  end
end
