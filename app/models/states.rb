class States < ActiveRecord::Base
   attr_accessible :name, :uf
   has_many :cities
   has_many :people
  def self.for_select
    self.all.map {|p| [p.name,p.id]}.sort
  
  end

end
