# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'bcrypt'

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: { message: "Password can't be blank "}
  validates :password, presence: true, length: { minimum: 6, allow_nil: true }
  validates :session_token, presence: true, uniqueness: true
  before_validation :ensure_session_token

  attr_reader :password
  def self.find_by_credentials(username, password)
    u =  User.find_by(username: username)
    return u if u && BCrypt::Password.new(u.password_digest).is_password?(password)
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(pass)
    @password = pass
    self.password_digest = BCrypt::Password.create(@password)
  end
end
