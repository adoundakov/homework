# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  email            :string           not null
#  password_digest  :string           not null
#  session_token    :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  activated        :boolean          default(FALSE), not null
#  activation_token :string           not null
#  admin            :boolean          default(FALSE), not null
#

class User < ApplicationRecord
  attr_reader :password

  after_initialize :ensure_session_token, :ensure_activation_token

  validates :email, :password_digest, :session_token, presence: true
  validates :password, presence: true, length: {minimum: 6, allow_nil: true}
  validates :email, uniqueness: true

  has_many :notes

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    return user if user && user.is_password?(password)
    nil
  end

  def ensure_activation_token
    self.activation_token ||= User.generate_session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
  end

  def password=(pass)
    @password = pass
    self.password_digest = BCrypt::Password.create(pass)
  end

  def is_password?(password)
    db_pass = BCrypt::Password.new(self.password_digest)
    db_pass.is_password?(password)
  end

  def promote!
    toggle!(:admin)
  end

  def activate!
    toggle!(:activated)
  end
end
