class Correction < ActiveRecord::Base
  attr_accessible  :validing, :number, :avaliable_id

  belongs_to :avaliable
end