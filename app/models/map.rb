class Map < ApplicationRecord
    after_validation :geocode

  def address
    [street, city, state, country].compact.join(', ')
  end

  private
  def geocode
    uri = URI.escape("https://maps.googleapis.com/maps/api/geocode/json?address="+@address.gsub(" ", "")+"&key=[ここにAPIキー]")
    res = HTTP.get(uri).to_s
    response = JSON.parse(res)
    self.latitude = response["results"][0]["geometry"]["location"]["lat"]
    self.longitude = response["results"][0]["geometry"]["location"]["lng"]
  end

end
