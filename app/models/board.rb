class Board < ApplicationRecord
  validates :title, presence: true, length: { in: 1..255 }
  validates :priority, uniqueness: true

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
