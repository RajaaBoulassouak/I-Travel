class LocationResults
  
  def initialize(location)
    @location = location
  end
  
  def places
    data = google_places_service.get_places
    data.map do |place|
      Place.new(place)
    end
  end
  
  def get_place_map(address)
    "https://maps.googleapis.com/maps/api/staticmap?center=#{address}&size=200x200&zoom=17&key=#{ENV['Google-Places-Key']}"
  end
  
  private 
  
  def google_places_service
    GooglePlacesService.new(@location)
  end
end 