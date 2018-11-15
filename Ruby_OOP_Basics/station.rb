class Station

  attr_reader :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def train_in(train)
    @trains << train
  end

  def trains
    if @trains.empty?
      puts "Сейчас на станции нет поездов"
    else
      puts "Список поездов на станции:"
	  @trains.each {|train| puts "Номер: #{train.number}, Тип: #{train.type}"}
	end
  end

  def trains_by_type
    if @trains.empty?
      puts "Сейчас на станции нет поездов"
    else
      puts "Список грузовых поездов:"
      @trains.each {|train| puts "Номер: #{train.number}" if train.type == 'Грузовой'}
      puts "Список пассажирских поездов:"
      @trains.each {|train| puts "Номер: #{train.number}" if train.type == 'Пассажирский'}
    end
  end

  def train_out(train)
    if @trains.include?(train)
      @trains.delete(train)
    else
      puts "Поезд #{train.number} не находится на станции"
    end
  end

end