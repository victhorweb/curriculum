class AddScoreToLevel < ActiveRecord::Migration
  def change
    add_column :levels, :score, :integer
  end
end
