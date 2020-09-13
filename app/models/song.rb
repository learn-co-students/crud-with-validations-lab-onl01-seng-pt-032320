class Song < ApplicationRecord
  validates :title, presence: true
  validate :annually_unique_name, on: %i[create update]
  validate :release_year_is_valid_if_released, on: %i[create update]
  validates :artist_name, presence: true

  def annually_unique_name
    return unless Song.all.find do |song|
      song.title == title && song.release_year == release_year && song.artist_name == artist_name
    end

    errors.add(:title, "can't be the same as another in the same year")
  end

  def release_year_is_valid_if_released
    return unless released && (!release_year || release_year > Time.now.year)

    errors.add(:release_year, 'must be present if released')
  end
end
