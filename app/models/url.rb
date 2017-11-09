class Url < ApplicationRecord
  SHORT_URL_LETTER = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
  before_validation :set_short_url
  validates :url, presence: true, uniqueness: true,
            format: /\A#{URI::regexp(%w(http https))}\z/
  validates :short_url, presence: true, uniqueness: true

  private

  def set_short_url
    self.short_url = Array.new(10) { SHORT_URL_LETTER.sample }.join
  end
end
