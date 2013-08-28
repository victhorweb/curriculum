class Status < ActiveRecord::Base
  attr_accessible :name
  has_many :inscritions

def self.for_select
    self.all.map {|p| [p.name,p.id]}.sort
 end

end
