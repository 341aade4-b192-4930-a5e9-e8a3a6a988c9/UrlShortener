class ShortUrlGenerator
  def self.call
    loop do
      # TODO: limit to retry
      # TODO: hex -> to ?
      short_url = SecureRandom.hex(5)
      break short_url unless Link.exists?(short_url: short_url)
    end
  end
end