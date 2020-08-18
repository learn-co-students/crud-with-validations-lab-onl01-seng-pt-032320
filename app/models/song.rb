class Song < ApplicationRecord
    validates :title, presence: true 
    
    validates :released, inclusion: {in: [true, false]}
    with_options if: :released? do |t|
        t.validates :title, uniqueness: { scope: :release_year}
        t.validates :release_year, presence: true, numericality: {less_than_or_equal_to: Time.now.year}
        t.validates :release_year, numericality: { only_integer: true }
    end
    validates :artist_name, presence: true
    
    def ryt
        if release_year > Time.now.year
            true
        else
            false
        end
    end
end
