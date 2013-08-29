class Person < ActiveRecord::Base
  include Paperclip::Glue

  attr_accessible :name, :phone, :mobile_phone, :semester, :work, :video_conf, :curriculum, :image, :email, :born_at, :plain_password
  attr_protected :password
  attr_accessor :image_file_name

  has_attached_file :image,  :dependent => :destroy, :styles => { :medium => "300x300>", :thumb => "120x90#" }

  validate :image, :unless => 'errors.any?'
  validates :name, presence: true
  validates :phone, presence: true,
          format: {with:/^\(\d{2}\)\d{4}-\d{4}$/}
  validates :mobile_phone, presence: true,
          format: {with:/^\(\d{2}\)\d{4}-\d{4}$/}
  validates :semester, presence:true
  validates :video_conf, presence: true
  validates :curriculum, presence: true
  validates :image, presence: true, format: {with:/(.*?)\.(jpg|jpeg|png|gif)$/}
  validates :email, presence: true #, format: {with:/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4}  )$/}

  belongs_to :state
  belongs_to :city
  belongs_to :university
  belongs_to :course
  belongs_to :sector

  has_many :skill_levels ,  :dependent => :destroy
  has_many :vacants, :dependent => :destroy,:through=>:skill_levels
  has_many :person_questions, :dependent => :destroy
  has_many :avaliables, :dependent => :destroy
  has_many :corrections, :dependent => :destroy,:through=>:person_questions
  has_many :inscritions, :dependent => :destroy


  def plain_password=(password)
    return if password.blank?
    self.password = self.class.encrypt_password(password)
  end

  def self.encrypt_password(password)
    Digest::SHA1.hexdigest("123_#{password}_456")
  end

  def self.auth(email,password)
    where(["email=? and password=?",email,encrypt_password(password)]).first
  end

end