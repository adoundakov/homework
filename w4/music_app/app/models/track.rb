# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  album_id   :integer          not null
#  track_type :string           not null
#  lyrics     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord
  belongs_to :album
  has_many :notes, dependent: :destroy
  validates :title, :album_id, :track_type, presence: true

  def album_name
    self.album.title
  end

  def band
    self.album.band
  end

  def band_name
    self.band.name
  end
end
