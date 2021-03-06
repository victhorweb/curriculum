class User < ActiveRecord::Base
  attr_accessible :email, :plain_password
  attr_protected :password

  validates_uniqueness_of :email, presence: true
  validates :password, presence: true

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