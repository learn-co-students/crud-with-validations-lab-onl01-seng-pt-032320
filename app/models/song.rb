class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: { scope: [:release_year, :artist_name], message: "Artists cannot release the same song more than once a year."}
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true, numericality: { less_than: Time.now.year }, unless: :is_not_released
    validates :artist_name, presence: true 

    def is_not_released
        released == false 
    end 
   
end
