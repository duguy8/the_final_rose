class Outing < ApplicationRecord
  validates_presence_of :name,
                        :location,
                        :date
  has_many :contestant_outings
  has_many :contestants, through: :contestant_outings
end