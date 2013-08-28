class Course < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :people

  validates :name, presence: true ,length:{maximum:100}

   def self.for_select
    self.all.map {|p| [p.name,p.id]}.sort
   end

end