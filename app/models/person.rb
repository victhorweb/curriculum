class Person < ActiveRecord::Base
  attr_accessible :name, :phone, :mobile_phone, :semester, :work, :video_conf, :curriculum, :image, :email, :born_at, :plain_password
  attr_protected :password

  validates :name, presence: true
  validates :phone, presence: true,
            format: {with:/^\(\d{2}\)\d{4}-\d{4}$/}
  validates :mobile_phone, presence: true,
            format: {with:/^\(\d{2}\)\d{4}-\d{4}$/}
  validates :semester, presence:true
  validates :video_conf, presence: true
  validates :curriculum, presence: true,
             format: {with:/(.*?)\.(jpg|jpeg|gif|pdf|doc)$/}
  validates :image, presence: true,
             format: {with:/(.*?)\.(jpg|jpeg|png|gif)$/}
  validates :email, presence: true,
            format: {with:/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/}

   # belongs_to :state
   belongs_to :city
   belongs_to :university
   belongs_to :course
   belongs_to :sector
   has_many :skill_levels
   has_many :vacants, :through=>:skill_levels


  def plain_password=(password)
    return if password.blank?
    self.password = self.class.encrypt_password(password)
  end

  def plain_password
    ""
  end

  def self.encrypt_password(password)
    Digest::SHA1.hexdigest("123_#{password}_456")
  end

  def self.auth(email,password)
    where(["email=? and password=?",email,encrypt_password(password)]).first
  end

end
