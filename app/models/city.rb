class City < ActiveRecord::Base
  self.primary_key = "id"

  attr_accessible :name, :uf, :state_id

  validates :name, presence: true
  validates :uf, presence: true
  validates :state_id, presence: true

  belongs_to :state

  has_many :people

  def self.for_select
    self.all.map {|p| [p.name,p.id]}.sort
  end

end
