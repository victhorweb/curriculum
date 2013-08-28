class CreateInscritions < ActiveRecord::Migration
  def change
    create_table :inscritions do |t|
      t.integer :person_id
      t.integer :vacant_id

      t.timestamps
    end
  end
end
