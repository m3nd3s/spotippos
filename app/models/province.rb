class Province < ApplicationRecord
  has_and_belongs_to_many :properties

  def as_json(options = nil)
    options ||= {}
    super({ only: :name }.merge(options))
  end
end
