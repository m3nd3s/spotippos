class PropertyQuery
  include ActiveModel::Model
  attr_accessor :ax, :ay, :bx, :by
  validates :ax, :ay, :bx, :by, presence: true

  def initialize(attributes={})
    super
  end

  def blank?
    ax.blank? && ay.blank? && by.blank? && bx.blank?
  end

  def query
    if blank?
      Property.includes(:provinces).all
    elsif valid?
      Property.includes(:provinces).where("x > ? AND x < ?", ax, bx)
              .where("y < ? AND y > ?", ay, by)
    else
      Property.none
    end
  end
end
