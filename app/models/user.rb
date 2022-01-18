class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: { case_sensitive: false },
    length: { in: 3..24 }
  validates :password, presence: true

  validate :validate_username_not_included_in_password

  private

  def validate_username_not_included_in_password
    if password.include?(username)
      errors.add(:password, 'contains username')
    end
  end
end
