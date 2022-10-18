# Курс: "Основы Ruby [Полная програмаа - 2022]"
# Задание: "Основы ООП в Ruby"
# Класс "Route"
# Студент: Константин Голуб (Kos)

class Route
  attr_reader :departure_station, :arrival_station, :stations

  def initialize(departure_station, arrival_station)
    @departure_station = departure_station
    @arrival_station = arrival_station
    @stations = [departure_station, arrival_station]
  end

  # Добавление промежуточной станции
  # Упрощениe:
  # Новая промежуточная станция добавляется в конец (перед станцией прибытия),
  # без предоставления выбора пользователю между какими станциями добавить новую
  def add_station(station)
    @stations.insert(-2, station) unless @stations.include?(station)
  end

  # Удаление промежуточной станции (аргумент - объект)
  # Станция не должна быть начальной или конечной
  def delete_station(station)
    if @stations.include?(station) &&
       station != @departure_station &&
       station != @arrival_station
      @stations.delete(station)
    end
  end

  # Вывод всех станций от начальной до конечной в порядке следования по маршруту
  def show_route
    @stations.each.with_index(1) { |station, index| puts "#{index}. #{station.name}" }
  end
end
