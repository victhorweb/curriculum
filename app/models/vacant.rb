class Vacant < ActiveRecord::Base
  include Paperclip::Glue
  attr_accessible :date_end, :description, :title,:sector_id,:image

  has_attached_file :image,  :styles => { :medium => "300x300>", :thumb => "90x90#" }

  belongs_to :sector

  validate :image, :unless => 'errors.any?'
  validates :description,presence: true
  validates :title,presence: true
  validates :date_end, presence: true
  validate :age_limit

  has_many :skills, :through =>:sectors
  has_many :person_questions
  has_many :avaliables

  scope :next, -> { where(["date_end>?",Time.now])}

  def valid_today?
    self.date_end > Date.today
  end

  def age_limit
    errors.add(:date_end,I18n.t("activerecord.errors.date_end")) unless self.date_end > Date.today
  end



end
