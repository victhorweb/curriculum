class Skill < ActiveRecord::Base
  attr_accessible :description, :name, :sector_id
  validates :name ,presence: true
  validates :description ,presence: true

  belongs_to :sector


end
