class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :release_year, presence: true, if: :released?
  validate :release_year_cannot_be_in_the_future

  def released?
    released
  end


  def release_year_cannot_be_in_the_future
    if release_year.present? && release_year > Date.today.year.to_i
      errors.add(:release_year, "can't be in the future")
    end
  end



end
