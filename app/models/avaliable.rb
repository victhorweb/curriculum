class Avaliable < ActiveRecord::Base
  attr_accessible :level_id, :person_id, :skill_id, :vacant_id

  validates :level_id, presence: true
  validates :person_id, presence: true
  validates :skill_id, presence: true
  validates :vacant_id, presence: true

  belongs_to :vacant
  belongs_to :level
  belongs_to :person
  belongs_to :skill

  has_many :corrections
end