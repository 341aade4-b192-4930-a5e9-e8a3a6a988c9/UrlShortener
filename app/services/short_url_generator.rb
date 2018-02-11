class ShortUrlGenerator
  SHORT_URL_LENGTH = 6

  def self.call
    charset = Array('0'..'9') + Array('a'..'z')

    loop do
      short_url =
          Array.new(SHORT_URL_LENGTH) do
            charset.sample
          end.join

      break short_url unless Link.exists?(short_url: short_url)
    end
  end
end