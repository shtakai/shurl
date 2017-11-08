class Url < ApplicationRecord
  before_validation :set_short_url
  validates :url, presence: true, uniqueness: true
  validates :short_url, presence: true, uniqueness: true

  private

  def set_short_url
    self.short_url = SecureRandom.urlsafe_base64(24)
  end

end
