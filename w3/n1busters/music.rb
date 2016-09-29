# app/models/track.rb
class Track
   belongs_to(
    :album,
    class_name: "Album",
    foreign_key: :album_id,
    primary_key: :id
  )
end

# app/models/album.rb
class Album
  belongs_to(
    :artist,
    class_name: "Artist",
    foreign_key: :artist_id,
    primary_key: :id
  )

  has_many(
    :tracks,
    class_name: "Track",
    foreign_key: :album_id,
    primary_key: :id
  )
end

# app/models/artist.rb
class Artist
  has_many(
    :albums,
    class_name: "Album",
    foreign_key: :artist_id,
    primary_key: :id
  )

  def n_plus_one_tracks
    albums = self.albums
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.name] = album.tracks.length
    end

    tracks_count
  end

  def better_tracks_query
    # TODO: your code here
    albums = self.albums.includes(:tracks)
    album_track_counts = {}
    albums.each do |album|
      album_track_counts[album] = album.tracks.length
    end
    album_track_counts
  end

  def even_better_tracks_query
    # the better_tracks_query method still pulls the track info from DB, can
    # do even better if we have pSQL do the counting for us.
    albums_with_counts = self.posts.select("tracks.*, COUNT(*) tracks_count")
                          .joins(:tracks).group("albums.id")

    albums_with_counts.each do |album|
      [album.title, album.tracks_count]
    end
  end
end
