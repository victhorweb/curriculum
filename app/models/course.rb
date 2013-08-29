class Course < ActiveRecord::Base
  attr_accessible :description, :name

  validates :description, presence: true
  validates :name, presence: true

  has_many :people

  validates :name, presence: true ,length:{maximum:100}

   def self.for_select
    self.all.map {|p| [p.name,p.id]}.sort
   end

end