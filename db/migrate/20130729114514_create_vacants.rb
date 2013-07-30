class CreateVacants < ActiveRecord::Migration
  def change
    create_table :vacants do |t|
      t.string :title
      t.string :description
      t.date :date_end
      t.integer :sector_id

      t.timestamps
    end
  end
end
