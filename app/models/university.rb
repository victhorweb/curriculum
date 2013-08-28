class University < ActiveRecord::Base
  attr_accessible :address, :state_id,:city_id, :district, :name, :phone, :zip_code
  has_many :people

  validates :name, presence: true
  validates :state_id, presence: true
  validates :phone, presence: true,
            format: {with:/^\(\d{2}\)\d{4}-\d{4}$/}
  validates :address, presence:true
  validates_length_of :address,maximum:200
  validates_length_of :district,maximum:50
  validates :district, presence:true
  validates :zip_code, presence: true,
            format: {with:/^\d{5}-\d{3}$/}

 def self.for_select
    self.all.map {|p| [p.name,p.id]}.sort
 end

end