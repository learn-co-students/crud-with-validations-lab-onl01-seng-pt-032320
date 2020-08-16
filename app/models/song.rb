class Song < ApplicationRecord
    validates :title, :artist_name, presence: true
    validates :title, uniqueness: { scope: [:year, :artist_name] }
    validates :released, inclusion: [true, false]
    validates :release_year, presence: true, if: :released
    validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: Time.new.year }
end
