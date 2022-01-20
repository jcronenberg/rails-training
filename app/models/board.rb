class Board < ApplicationRecord
  validates :title, presence: true, length: { in: 1..255 }
  validates :priority, uniqueness: true
end
