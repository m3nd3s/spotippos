class Property < ApplicationRecord
  validates :x, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 1400
  }
  validates :y, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 1000
  }
  validates :beds, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5
  }
  validates :baths, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 4
  }
  validates :square_meters, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 20,
    less_than_or_equal_to: 240
  }
end
