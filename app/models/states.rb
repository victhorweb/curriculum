class States < ActiveRecord::Base
   self.primary_key = "id"

   attr_accessible :name, :uf

   validates :name, presence: true
   validates :uf, presence: true

   has_many :cities
   has_many :peple

  def self.for_select
    self.all.map {|p| [p.name,p.id]}.sort
  end

end
