class City < ActiveRecord::Base
  set_primary_key :id

  attr_accessible :name, :uf, :state_id

  belongs_to :state

  has_many :people

  def self.for_select
    self.all.map {|p| [p.name,p.id]}.sort
  end

end