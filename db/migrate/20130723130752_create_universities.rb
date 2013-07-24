class CreateUniversities < ActiveRecord::Migration
  def change
    create_table :universities do |t|
      t.string :name
      t.integer :state_id
      t.integer :city_id
      t.string :phone
      t.string :address
      t.string :district
      t.string :zip_code

      t.timestamps
    end
  end
end
