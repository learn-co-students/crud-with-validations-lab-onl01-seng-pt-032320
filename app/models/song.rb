class Song < ApplicationRecord
    validates :title, :artist_name, presence: true
    validates :title, uniqueness: { scope: [:release_year, :artist_name] }
    validates :released, inclusion: [true, false]
    with_options if: :released? do |o|
        o.validates :release_year, presence: true
        o.validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: Time.new.year }
    end
end
