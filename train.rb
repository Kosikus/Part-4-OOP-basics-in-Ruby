# Курс: "Основы Ruby [Полная програмаа - 2022]"
# Задание: "Основы ООП в Ruby"
# Класс "Train"
# Студент: Константин Голуб (Kos)

# "Может набирать скорость" - сделал просто через метод-сеттер "speed"

class Train
  attr_reader :number, :type, :wagon_quantity, :current_station
  attr_accessor :speed

  def initialize(number, type, wagon_quantity)
    @number = number
    @type = type
    @wagon_quantity = wagon_quantity
    @speed = 0
    @route = nil
    @current_station = nil
  end

  # Остановка поезда
  def stop
    @speed = 0
  end

  # Добавление вагона
  def add_wagon
    if speed.zero?
      @wagon_quantity += 1
    end
  end

  # Удаление вагона
  def remove_wagon
    if speed.zero? && wagon_quantity > 0
      @wagon_quantity -= 1
    end
  end

  # Получение маршрута
  def set_route(route)
    @route = route

    @current_station = @route.departure_station
  end

  # Переход на следующую станцию
  # Если находимся на конечной, то на ней и остаёмся
  def go_to_next_station
    if @current_station != @route.arrival_station
      @current_station = @route.stations[@route.stations.index(@current_station) + 1]
    end
  end

  # Переход на предыдущую станцию
  # Если находимся на начальной станции, то на ней и остаёмся
  def go_to_previous_station
    if @current_station != @route.departure_station
      @current_station = @route.stations[@route.stations.index(@current_station) - 1]
    end
  end

  # Следующая станция
  def next_station
    if @current_station != @route.arrival_station
      @route.stations[@route.stations.index(@current_station) + 1]
    else
      @current_station
    end
  end

  # Предыдущая станция
  def previous_station
    if @current_station != @route.departure_station
      @route.stations[@route.stations.index(@current_station) - 1]
    else
      @current_station
    end
  end
end
