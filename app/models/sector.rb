class Sector < ActiveRecord::Base
   attr_accessible :description, :name

   validates :name, presence: true
   validates :description, presence: true

   has_many :vacants
   has_many :skills

   def self.for_select
      self.all.map {|p| [p.name,p.id]}
   end

end