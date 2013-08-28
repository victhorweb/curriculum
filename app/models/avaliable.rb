class Avaliable < ActiveRecord::Base
  attr_accessible :level_id, :person_id, :skill_id, :vacant_id

  belongs_to :vacant
  belongs_to :level
  belongs_to :person
  belongs_to :skill

  has_many :corrections
end