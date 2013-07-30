class Vacant < ActiveRecord::Base
  attr_accessible :date_end, :description, :title,:sector_id
  belongs_to :sector
  validates :description,presence: true
  validates :title,presence: true
  validates :date_end, presence: true
  validate :age_limit

  # def date_validate()
  # 	if :date_end < Date.today
  # 		return false
 	# end
  # end
  def age_limit
    errors.add(:date_end,I18n.t("activerecord.errors.date_end")) unless self.date_end > Date.today
    end
end
