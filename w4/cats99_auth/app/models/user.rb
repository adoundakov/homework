# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  attr_reader :password
  validates :username, uniqueness: true
  validates :username, :session_token, :password_digest, presence: true
  validate :password, length: {minimum: 2, allow_nil: true}

  before_validation :ensure_session_token

  has_many :cats,
    dependent: :destroy

  def self.find_by_credentials(username, pass)
    user = User.find_by_username(username)
    return nil unless user
    return user if user.is_password?(pass)
    nil
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

  def password= (pass)
    @password = pass
    self.password_digest = BCrypt::Password.create(pass)
  end

  def is_password?(pass)
    BCrypt::Password.new(self.password_digest).is_password?(pass)
  end
end
