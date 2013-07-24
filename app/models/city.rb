class City < ActiveRecord::Base
  attr_accessible :name, :states_id, :uf
   def self.for_select
    self.all.map {|p| [p.name,p.id]}.sort
  end
end
