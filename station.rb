class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name # имя станции
    @trains = [] # массив (объектов) всех поездов на станции на текущий момент
  end

  # Приём поезда на станцию
  def accept_train(train)
    # добавление нового поезда на станцию, если такого поезда ещё нет на станции
    @trains << train unless @trains.include?(train)
  end

  # Массив всех поездов на станции по типу ("passenger"/"cargo")
  def trains_by_type(type)
    case type.downcase
    when "passenger"
      trains.select { |train| train.type.casecmp("passenger") }
    when "cargo"
      trains.select { |train| train.type.casecmp("cargo") }
    end
  end

  # Количество поездов на станции по типу "passenger"/"cargo"
  def trains_amount_by_type(type)
    case type.downcase
    when "passenger"
      trains.select { |train| train.type.casecmp("passenger") }.size
    when "cargo"
      trains.select { |train| train.type.casecmp("cargo") }.size
    end
  end

  # Отправление поезда
  def depart_train(train)
    # удаление поезда со станции, если такой поезд есть на станции
    @trains.delete(train) if @trains.include?(train)
  end
end
