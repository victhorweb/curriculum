class AddColumCOrrections < ActiveRecord::Migration
  def up
     add_column :corrections , :person_questions_id, :integer
  end

  def down
    remove_column :corrections , :person_questions_id
  end
end
