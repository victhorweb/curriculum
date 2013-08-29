class Essay < ActiveRecord::Base
  attr_accessible :question, :skill_id, :level_id,:reply

   validates :question, presence: true
   validates :skill_id, presence: true
   validates :level_id, presence: true
   validates :reply, presence: true

  belongs_to :level

  has_many :levels, :through => :skills
  has_many :person_questions

  scope :random, order: 'RAND()'

end