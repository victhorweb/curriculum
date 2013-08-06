class Level < ActiveRecord::Base
  attr_accessible :name, :score
  has_many :skill_level

  default_scope order("score")
end
