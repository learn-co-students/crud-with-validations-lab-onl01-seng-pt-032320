class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :released, inclusion: { in: [true, false] }
  #validate :not_repeated
  validate :correct_release
  validates :title, uniqueness: { scope: :release_year, message: "Cannot be repeated by the same artist in the same year" }
  
  # def not_repeated
  #   @song = Song.find_by title: :title, release_year: :release_year
  #   if @song
  #     errors.add(:title, "Cannot be repeated by the same artist in the same year")
  #   end
  # end
  
  def correct_release
    year = Date.today.year
    if release_year && release_year >= year
      errors.add(:release_year, "Must be less than or equal to the current year")
    elsif released && release_year == nil 
      errors.add(:title, "Must not be blank if released")
    end
  end
end