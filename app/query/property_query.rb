class PropertyQuery
  include ActiveModel::Model
  attr_accessor :ax, :ay, :bx, :by
  validates :ax, :ay, :bx, :by, presence: true

  def initialize(attributes={})
    super
  end

  def query
    if valid?
      Property.where("x > ? AND x < ?", ax, bx)
              .where("y < ? AND y > ?", ay, by)
    else
      Property.none
    end
  end
end
