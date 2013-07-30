class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :phone
      t.string :mobile_phone
      t.integer :university_id
      t.integer :course_id
      t.integer :semester
      t.integer :state_id
      t.integer :city_id
      t.boolean :work
      t.string :video_conf 
      t.string :curriculum
      t.integer :sector_id
      t.string :image
      t.string :email
      t.date :born_at
      t.string :password
      t.timestamps
    end
  end
end
