class Bachelorette <ApplicationRecord
  has_many :contestants

  def average_contestant_age
    contestants.average(:age)
  end
end
