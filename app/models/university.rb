class University < ActiveRecord::Base
  attr_accessible :address, :city_id, :district, :name, :phone, :state_id, :zip_code
  validates :name, presence: true 
end
