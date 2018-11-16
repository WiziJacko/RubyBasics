class Station

  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def train_in(train)
    @trains << train
  end

  def trains_by_type(type)
    @trains.each { |train| puts train if train.type == type }
  end

  def train_out(train)
    @trains.delete(train)
  end

end
