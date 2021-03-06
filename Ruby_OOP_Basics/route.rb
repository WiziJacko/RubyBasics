class Route

  attr_reader :stations

  def initialize(station_of_departure, station_of_arrival)
    @stations = [station_of_departure, station_of_arrival]
  end

  def add_station(station)
    return if @stations.include?(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    if station != @stations[0] && station != @stations[-1]
      @stations.delete(station)
    end
  end
 
  def show_stations
    puts "Список станций маршрута:"
    puts "--------------"
    @stations.each { |station| puts station.name }
    puts "--------------"
  end

end
