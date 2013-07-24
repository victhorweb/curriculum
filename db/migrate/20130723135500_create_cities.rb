class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.integer :states_id
      t.string :uf
      t.string :name

      t.timestamps
    end
  end
end
