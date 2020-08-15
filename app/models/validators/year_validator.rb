class SongValidator < ActiveModel::Validator
    
    def validate(song)
        unless Song.all.any? {|s| s.title == title && s.release_year == release_year}
            song.errors[:title] << "This song already exists!"
        end
    end

end