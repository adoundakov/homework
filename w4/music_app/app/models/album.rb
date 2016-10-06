# == Schema Information
#
# Table name: albums
#
#  id              :integer          not null, primary key
#  title           :string           not null
#  band_id         :integer          not null
#  production_type :string           not null
#  genre           :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Album < ApplicationRecord
  Genres = %w(Classical Jazz Rock Folk Hip-hop Country/Western Blues Gospel Electronic Ethnic)
  belongs_to :band

  has_many :tracks, dependent: :destroy

  validates :title, :band_id, :production_type, :genre, presence: true
  validates :genre, inclusion: { in: Genres,
                                 message: "Genre not in valid list!"}
  # TODO: add custom validation for the genre? production_type?
  def band_name
    self.band.name
  end
end
