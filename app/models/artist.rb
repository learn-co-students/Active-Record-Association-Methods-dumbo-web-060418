

class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def get_genre_of_first_song
    song_id = self.songs.first.genre_id
    Genre.select do |genre|
      genre.id == song_id
    end.first
  end

  def song_count
    self.songs.count
  end

  def genre_count
    self.genres.count
  end
end
