class Level < ActiveRecord::Base
  attr_accessible :name, :score

  has_many :skill_levels
  has_many :essays
  has_many :corrections
  has_many :avaliables

  scope :order_by_score, order: 'score ASC'
  scope :with_essays, joins: :essays,  group: 'levels.id'
 def self.for_select
   self.all.map {|p| [p.name,p.id]}.sort
  end

end