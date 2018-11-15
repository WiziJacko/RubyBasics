class Train

  attr_reader :speed, :carriages, :number, :type
  attr_accessor :route

  def initialize(number, type, carriages)
    @number = number
    @type = type
    @carriages = carriages
    @speed = 0
    @current_station
  end

  def speed_up
    @speed += 20
    puts "Поезд набирает скорость..."
    puts "Поезд разогнался до #{self.speed} км/ч"
  end

  def stop
    @speed = 0
    puts "Поезд остановился"
  end

  def hook_carriage
    if @speed == 0
      @carriages += 1
      puts "Прицеплен вагон. Текущее количество вагонов: #{self.carriages}"
    else
      puts "Прицеплять вагон нельзя"
    end
  end

  def unhook_carriage
    if @speed == 0 && @carriages > 0
      @carriages -= 1
      puts "Отцеплен вагон. Текущее количество вагонов: #{self.carriages}"
    else
      puts "Отцепить вагон нельзя"
    end
  end

  def get_route(route)
    self.route = route
    @current_station = self.route.stations[0]
    @current_station.train_in(self)
    puts "Поезд принят на маршрут. Станция отправления: #{self.route.stations[0].name}"
  end

  def current_station
    if @current_station.nil?
      puts "Поезд находится в депо"
    else
      puts "Текущая станция: #{@current_station.name}"
    end
  end

  def previous_station
    if @current_station.nil?
      puts "Поезд находится в депо"
    elsif @current_station == self.route.stations.first
      puts "Поезд находится на станции отправления"
    else
      position = self.route.stations.index(@current_station)
      puts "Предыдущая станция: #{self.route.stations[position - 1].name}"
    end
  end

  def next_station
    if @current_station.nil?
      puts "Поезд находится в депо"  
    elsif @current_station == self.route.stations.last
      puts "Поезд находится на станции прибытия"
    else
      position = self.route.stations.index(@current_station)
      puts "Следующая станция: #{self.route.stations[position + 1].name}"
    end
  end

  def go_next_station
    position = self.route.stations.index(@current_station)
    if @current_station == self.route.stations.last
      puts "Поезд уже находится на станции прибытия"
    else
      @current_station.train_out(self)
      @current_station = self.route.stations[position + 1]
      @current_station.train_in(self)
      puts "Поезд отправился на станцию #{@current_station.name}"
    end
  end

  def go_previous_station
    position = self.route.stations.index(@current_station)
    if @current_station == self.route.stations.first
      puts "Поезд уже находится на станции прибытия"
    else
      @current_station.train_out(self)
      @current_station = self.route.stations[position - 1]
      @current_station.train_in(self)
      puts "Поезд отправился на станцию #{@current_station.name}"
    end
  end

end
