class Route

  attr_reader :stations

  def initialize(station_of_departure, station_of_arrival)
    @stations = [station_of_departure, station_of_arrival]
  end

  def add_station(station)
  	if @stations.include?(station)
      puts "Станция уже находится в маршруте"
    else
      @stations.insert(-2, station)
      puts "В марщрут добавлена станция #{station.name}"
      self.stations
    end
  end

  def delete_station(station)
    if @stations.include?(station) && station != @stations[0] && station != @stations[-1]
      @stations.delete(station)
      puts "Станция #{station.name} удалена из маршрута"
      self.stations
    else
      puts "Станцию #{station.name} нельзя исключить из маршрута"
    end
  end

  def all_stations
    puts "Список станций маршрута:"
    puts "--------------"
    @stations.each {|station| puts station.name}
    puts "--------------"
  end

end
