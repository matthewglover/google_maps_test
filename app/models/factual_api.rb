require "factual"

class FactualApi

  attr_reader :rows

  OAUTH_KEY = "gIkOBZRVNBX23bLjwSmNkOIDrPruXl4SPg0ptykE"
  OAUTH_SECRET = "mzTmiUogEQjEKoPBq0duRpNT1g2nHOyJM20k1xVr"

  def search(options)
    search = options[:search]
    lat = options[:lat]
    lng = options[:lng]
    radius = options[:radius]
    page = options[:page]

    query = factual.table('places')
    query  = query.filters('country' => 'GB')
    query  = query.geo("$circle" => {"$center" => [lat, lng], "$meters" => radius})
    query = query.search(search)
    query  = query.sort('$distance:asc,name:asc')
    query = query.page(page, per: 10)
    @rows = query.rows
  end

  private

    def factual
      @_factual ||= Factual.new(OAUTH_KEY, OAUTH_SECRET)
    end
end