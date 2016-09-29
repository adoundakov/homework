# app/models/driver.rb
class Driver
  belongs_to(
    :bus,
    class_name: "Bus",
    foreign_key: :bus_id,
    primary_key: :id
  )
end


# app/models/bus.rb
class Bus
  belongs_to(
    :route,
    class_name: "Route",
    foreign_key: :route_id,
    primary_key: :id,
  )

  has_many(
    :drivers,
    class_name: "Driver",
    foreign_key: :bus_id,
    primary_key: :id,
  )
end


# app/models/route.rb
class Route
  has_many(
    :buses,
    class_name: "Bus",
    foreign_key: :route_id,
    primary_key: :id
  )

  def n_plus_one_drivers
    buses = self.buses

    all_drivers = {}
    buses.each do |bus|
      drivers = []
      bus.drivers.each do |driver|
        drivers << driver.name
      end
      all_drivers[bus.id] = drivers
    end

    all_drivers
  end

  def better_drivers_query
    # TODO: your code here
    buses_with_ids_and_drivers = self.buses.includes(:drivers => [:name])
    buses_to_drivers = Hash.new {[]}
    buses_with_ids_and_drivers do |bus|
      buses_to_drivers[bus.id] += bus.drivers.map { |d| d.name } # ?? will this work since we prefetched all the driver names
    end                                                          # as well as the list of driver objects. Still 1 query only?

    buses_to_drivers
  end

  def simpler_better_drivers_query
    buses = self.buses.includes(:drivers)

    buses_to_drivers = {}
    buses.each do |bus|
      bus_drivers = []
      bus.drivers.each { |driver| bus_drivers << driver.name }
      buses_to_drivers[bus.id] = bus_drivers
    end

    buses_to_drivers
  end
end

# create a hash with the bus ids as keys and an array of drivers as values
# ie: {1: ['Alex D','Bob D','Charlie C','David B']}
