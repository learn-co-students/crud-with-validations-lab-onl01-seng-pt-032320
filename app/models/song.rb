class Song < ApplicationRecord
    validates :title, presence: true
    validates :artist_name, presence: true
    validate :no_repeat
    validates :release_year, presence: true, 
        if: :released?
    validate :possible_release_year

    def no_repeat
        Song.all.each do |s|
            if (s.title == title &&
                s.artist_name == artist_name &&
                s.release_year == release_year)
                errors.add(:title, "no dublicate songs")
            end 
        end 
    end 

    def possible_release_year
        if !release_year.nil? && release_year > Date.today.year
            errors.add(:release_year, "release date cannot be in the future")
        end 
    end 
end
