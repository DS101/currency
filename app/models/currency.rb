class Currency < ApplicationRecord
  validates :name, presence: true
  validates :code, presence: true, uniqueness: true
  validates :value, presence: true

  def to_json
    {
      id: id,
      code: code,
      name: name,
      value: value
    }
  end
end
