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

class User < ApplicationRecord
  before_validation :ensure_session_token
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true, length: { 6, allow_nil: true }

  def self.find_by_credentials(username, password)

  end

  def self.generate_session_token

  end

  def reset_session_token!

  end

  def ensure_session_token

  end

  def password=

  end
end
