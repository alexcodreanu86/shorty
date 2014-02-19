class Url < ActiveRecord::Base
  # Remember to create a migration!
  before_save  :generate_short_url
  # validates :short_url, uniqueness: true
  # validates :long_url, uniqueness: true
  def generate_short_url
    self.short_url = SecureRandom.base64(6).gsub(/\W/,"")
    binding.pry
  end
end
