class Bachelorette <ApplicationRecord
  has_many :contestants

  def average_contestant_age
    contestants.average(:age)
  end

  def unique_hometowns
    towns = contestants.order(:hometown).distinct.pluck(:hometown)
    towns.join(", ")
  end
end
