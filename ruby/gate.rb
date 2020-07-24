class Gate
  STATION = [:umeda, :juso, :mikuni]
  FARES = [150, 190]


  def initialize(station)
    @station = station
  end

  def enter(ticket)
    ticket.stamp(@station)
  end

  def exit(ticket)
    fare = fare_calc(ticket)
    fare <= ticket.fare
  end

  def fare_calc(ticket)
    from = STATION.index(ticket.stamped_at)
    to = STATION.index(@station)
    distance = from - to
    FARES[distance - 1]
  end

end

