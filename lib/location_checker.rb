class LocationChecker
  def self.preferred_location_available?(tweet_location)
    preferred_location_array = ['nyc', 'new york', 'manhattan', 'queens', 'long island', 'hoboken', 'brooklyn', 'jersey', 'bronx', 'staten island', 'harlem', 'boston', 'cambridge', 'newton', 'watertown', 'winthrop', 'revere', 'chelsea', 'everett', 'somerville', 'brookline','milton', 'charlestown', 'los angeles', 'la city', 'hollywood', 'wilshire', 'westside', 'crescenta valleys', 'glendale', 'pasadena', 'el monte', 'downey', 'inglewood', 'san francisco', 'sfo', 'bay area', 'mission bay', 'hayes valley', 'fillmore', 'noe valley', 'bernal heights', 'berkley', 'mill valley', 'daly city', 'san bruno']
    preferred_location_array.each do |location|
      unless tweet_location.nil?
        return true if tweet_location.downcase.include? location.downcase
      end
    end
    return false
  end
end