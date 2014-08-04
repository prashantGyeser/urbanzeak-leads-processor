class LocationChecker
  def self.preferred_location_available?(tweet_location)
    preferred_location_array = ['New York City', 'New York', 'NYC', 'Long Island', 'Jersey City', 'Hoboken', 'Manhattan', 'Queens', 'Bronx', 'Brooklyn', 'Staten Island', 'Harlem', 'Boston', 'Cambridge', 'Newton', 'Watertown',  'Winthrop', 'Revere', 'Chelsea', 'Everett', 'Somerville', 'Brookline','Milton', 'Charlestown', 'Los Angeles', 'LA', 'LA City', 'Hollywood', 'Wilshire', 'Westside', 'Crescenta Valleys', 'Glendale', 'Pasadena', 'El Monte', 'Downey', 'Inglewood', 'San Francisco', 'SFO', 'Bay Area', 'Mission Bay', 'Hayes Valley', 'Fillmore', 'Noe Valley', 'Bernal Heights', 'Berkley', 'Mill Valley', 'Daly City', 'San Bruno']
    preferred_location_array.each do |location|
      unless tweet_location.nil?
        return true if tweet_location.downcase.include? location.downcase
      end
    end
    return false
  end
end