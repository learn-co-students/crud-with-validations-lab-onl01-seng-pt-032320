class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :artist_name, presence: true
    validate :unique_title
    validates :release_year, presence: true,
        if: :released?
    validate :future_date


    def unique_title
        if Song.any? {|s| s.title == title && s.artist_name == artist_name && s.release_year == release_year}
            errors.add(:title, "That song already exists!")
        end
    end

    def future_date
        if release_year.present? && release_year > Date.today.year
            errors.add(:release_year, "That year hasn't happened yet!")
        end
    end

end
