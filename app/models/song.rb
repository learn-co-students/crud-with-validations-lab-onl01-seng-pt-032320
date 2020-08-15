class Song < ApplicationRecord
    validates :title, presence: true
    validates :released, inclusion: {in: [true, false]}
    validates :release_year, 
        presence: true, if: :released?, 
        inclusion: {in: Time.zone.now.year - 1000..Time.zone.now.year}
    validates :artist_name, presence: true
    validate :no_same_title
    #validates_with SongValidator

    def no_same_title
        if Song.any? {|s| s.title == title && s.artist_name == artist_name && s.release_year == release_year}
            errors.add(:title, "can't add the same song twice")
        end
    end

end
