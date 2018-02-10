class ShortUrlNavigator
  def self.call(short_url)
    @link = Link.find_by_short_url!(short_url)

    @link.update(
        all_clicks: @link.all_clicks + 1
    )

    @link.original_url
  end
end