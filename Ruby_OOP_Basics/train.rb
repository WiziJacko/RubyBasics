class Train

  attr_reader :speed, :carriages, :number, :type, :route

  def initialize(number, type, carriages)
    @number = number
    @type = type
    @carriages = carriages
    @speed = 0
    @current_station
    @route
  end

  def speed_up
    @speed += 20
  end

  def stop(value)
    if @speed - value < 0 
      @speed = 0
    else
      @speed -= value
    end
  end

  def hook_carriage
    if @speed == 0
      @carriages += 1
    end
  end

  def unhook_carriage
    if @speed == 0 && @carriages > 0
      @carriages -= 1
    end
  end

  def get_route(route)
    @route = route
    @current_station = 0
    self.route.stations[0].train_in(self)
  end

  def current_station
    self.route.stations[@current_station]
  end

  def previous_station
    if @current_station != 0
      self.route.stations[@current_station - 1]
    end
  end

  def next_station
    if @current_station != self.route.stations.size - 1
      self.route.stations[@current_station + 1]
    end
  end

  def go_next_station
    if @current_station != self.route.stations.size - 1
      self.route.stations[@current_station].train_out(self)
      @current_station += 1
      self.route.stations[@current_station].train_in(self)
      self.route.stations[@current_station]
    end
  end

  def go_previous_station
    if @current_station != 0
      self.route.stations[@current_station].train_out(self)
      @current_station -= 1
      self.route.stations[@current_station].train_in(self)
      self.route.stations[@current_station]
    end
  end

end
