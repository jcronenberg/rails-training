class BoardThread < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :board

  validates :title, presence: true
end
