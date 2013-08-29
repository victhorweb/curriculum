# encoding: utf-8
class SkillLevel < ActiveRecord::Base
   attr_accessible :person_id, :skill_id, :level_id,:vacant_id

    validates :person_id, presence: true
    validates :skill_id, presence: true
    validates :level_id, presence: true
    validates :vacant_id, presence: true

   belongs_to :person
   belongs_to :skill
   belongs_to :level
   belongs_to :vacant

   before_save :check_skills

   private
   def check_skills
     if !self.vacant.sector.skill_ids.include?(self.skill_id)
        errors.add(:skill_id,"Não pertence ao setor da vaga")
        return false
     end
     true
   end


end