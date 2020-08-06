class Song < ApplicationRecord
    validates :title, presence: true 
    validates :title, uniqueness: { scope: [:artist_name, :release_year] }
    validates :released, inclusion: { in: %w(true false) }
    if released
    validates :release_year, presence: true
    end 
    validates :artist_name, presence: true 

end
