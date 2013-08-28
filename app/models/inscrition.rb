class Inscrition < ActiveRecord::Base
  attr_accessible :person_id, :vacant_id, :status_id

  belongs_to :person
  belongs_to :vacant
  belongs_to :status

  scope :by_state, ->(status) {where(["status_id = ?", status]) }
  scope :by_sector, ->(sector) { joins(:vacant).where(["vacants.sector_id = ?", sector]) }
  scope :by_vacant,->(vacant) { where(["vacant_id = ?",vacant])}

  validates_uniqueness_of :person_id, :scope => :vacant_id

  def self.search(options = {})
    r = scoped
    r = r.by_state(options[:statu]) if options[:statu]
    r = r.by_sector(options[:sector]) if options[:sector]
    r = r.by_vacant(options[:vacant]) if options[:vacant]
    r
  end

end