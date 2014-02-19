class Url < ActiveRecord::Base
  # Remember to create a migration!
  before_save  :generate_short_url

  def generate_short_url
    @short_url = SecureRandom.base64(6).gsub(/\W/,"")
  end
end
