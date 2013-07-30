class Sector < ActiveRecord::Base
   attr_accessible :description, :name
   validates :name, presence: true
   has_many :vacant
   has_many :skill
   has_many :people
   def self.for_select
   self.all.map {|p| [p.name,p.id]}.sort
  
  end
end
