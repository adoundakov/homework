# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  track_id   :integer          not null
#

class Note < ApplicationRecord
  validates :body, :user_id, presence: true

  belongs_to :user
  belongs_to :track

  def track_name
    self.track.title
  end

  def user_email
    self.user.email
  end
end
