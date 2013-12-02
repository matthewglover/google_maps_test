require "factual"

class FactualApi

  attr_reader :rows

  OAUTH_KEY = "gIkOBZRVNBX23bLjwSmNkOIDrPruXl4SPg0ptykE"
  OAUTH_SECRET = "mzTmiUogEQjEKoPBq0duRpNT1g2nHOyJM20k1xVr"

  def getPlacesNear(options)
    search = options[:search]
    latitude = options[:latitude]
    longitude = options[:longitude]
    diameter = options[:diameter] || 50
    page = options[:page] || 1

    query = factual.table('places')
    query  = query.filters('country' => 'GB')
    query  = query.geo("$circle" => {"$center" => [latitude, longitude], "$meters" => diameter})
    query = query.search(search)
    query  = query.sort('name')
    query = query.page(page, per: 5)
    @rows = query.rows
  end

  private

    def factual
      @_factual ||= Factual.new(OAUTH_KEY, OAUTH_SECRET)
    end
end