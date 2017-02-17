class Property < ApplicationRecord
  alias_attribute :squareMeters, :square_meters
  alias_attribute :squareMeters=, :square_meters=
  alias_attribute :lat, :x
  alias_attribute :long, :y
  has_and_belongs_to_many :provinces, autosave: true

  before_save do |property|
    self.province_ids = Province.where("ax < :x AND bx > :x", x: x)
                            .where("ay > :y AND by < :y", y: y).pluck(:id)
  end

  def province_names
    provinces.map(&:name)
  end

  validates :x, uniqueness: { scope: :y }
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

  def as_json(options = nil)
    options ||= {}
    super({ except: [:created_at, :updated_at], methods: :province_names }.merge(options))
  end
end
