require 'spec_helper'
require_relative '../../app/assets/models/user.rb'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:session_token) }
  it { should validate_presence_of(:password_digest) }

  it { should validate_uniqueness_of(:username) }
  it { should validate_length_of(:password) }

  it { should have_many(:posts) }
  it { should have_many(:moderated_subs) }
end
