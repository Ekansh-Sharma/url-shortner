class UrlShort < ActiveRecord::Base
  validates :original_url, uniqueness: true, presence: true
  validates_format_of :original_url, :with => /(https?:\/\/(?:www\.|(?!www))[^\s\.]+\.[^\s]{2,}|www\.[^\s]+\.[^\s]{2,})/, :message => "must be prefixed with one of these www,http,https" 
  after_create :generate_short_url

  def generate_short_url
    self.short_token = object_id.to_s(36)
    self.short_url = APP_CONFIG[Rails.env] + short_token
    self.save
  end

  def get_original_url
    original_url.split('.')[0] == 'www' ? "http://" + original_url : original_url
  end
end
