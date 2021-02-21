class Outing < ApplicationRecord
  validates_presence_of :name,
                        :location,
                        :date
  has_many :contestant_outings
  has_many :contestants, through: :contestant_outings

  def contestant_count
    contestants.size
  end

  def contestant_names
    names = contestants.pluck(:name)
    names.join(", ")
  end
end
