class Route
  attr_reader :departure_station, :arrival_station, :stations

  def initialize(departure_station, arrival_station)
    @departure_station = departure_station
    @arrival_station = arrival_station
    @intermediate_stations = []
    @stations = [departure_station, arrival_station]
  end

  # Добавление промежуточной станции
  # Упрощениe:
  # Новая промежуточная станция добавляется в конец (перед станцией прибытия),
  # без предоставления выбора пользователю между какими станциями добавить новую
  def add_station(station)
    @intermediate_stations << station unless @intermediate_stations.include?(station)
    @stations = [departure_station] + @intermediate_stations + [arrival_station]
  end

  # Удаление промежуточной станции (аргумент - объект)
  def delete_station(station)
    @intermediate_stations.delete(station) if @intermediate_stations.include?(station)
    @stations = [departure_station] + @intermediate_stations + [arrival_station]
  end

  # Вывод всех станций от начальной до конечной в порядке следования по маршруту
  def show_route
    puts "1. #{@departure_station.name} - станция отправления"

    @intermediate_stations.each.with_index(2) { |station, index| puts "#{index}. #{station.name}" }

    puts "#{@intermediate_stations.size + 2}. #{@arrival_station.name} - станция прибытия"
  end
end
