class Song < ApplicationRecord
    validate :test_release_year
    validates :title, :genre, presence: true
    validates :released, inclusion: { in: [ true, false ] }
    validates :title, uniqueness: true, if: :same_year_and_artist?
    validates :release_year, presence: true, if: :released?

    def released?
      released == true
    end

    def same_year_and_artist?
      Song.find_by(title: title, artist_name: artist_name, release_year: release_year)
    end

    def test_release_year
      if release_year && release_year > Date.current.year
      errors.add(:release_year, "cannot be released after current year")
      end
    end
  
end