class States < ActiveRecord::Base
   set_primary_key :id

   attr_accessible :name, :uf

   has_many :cities
   has_many :peple

  def self.for_select
    self.all.map {|p| [p.name,p.id]}.sort
  end

end
