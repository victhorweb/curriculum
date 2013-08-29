class Skill < ActiveRecord::Base
  attr_accessible :description, :name, :sector_id, :score
  validates :name ,presence: true
  validates :description ,presence: true
  validates :sector_id, presence: true
  validates :score, presence: true

  belongs_to :sector

  has_many :skill_levels
  has_many :essays
  has_many :avaliables

  def self.for_select
   self.all.map {|p| [p.name,p.id]}.sort
  end

end