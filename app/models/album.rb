class Album < ApplicationRecord

  validates :artist_id, :name, :year, presence: true
  validates :year, numericality: { only_integer: true, less_than_or_equal_to: Date.today.year }

end
