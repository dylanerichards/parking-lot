require_relative "lib/spot"
require_relative "lib/car"
require_relative "lib/parking_lot"

# Create Spots
spot1 = Spot.new(floor: 1, size: 10)
spot2 = Spot.new(floor: 1, size: 15)
spot3 = Spot.new(floor: 2, size: 15)
spot4 = Spot.new(floor: 2, size: 15)
spot5 = Spot.new(floor: 3, size: 20)
spot6 = Spot.new(floor: 3, size: 30)
spots = [spot1, spot2, spot3, spot4, spot5, spot6]

# Create Cars
jaguar   = Car.new(size: 45, price: 170, brand: "Jaguar"   )
mercedes = Car.new(size: 10, price: 100, brand: "Mercedes" )
dodge    = Car.new(size: 15, price: 50,  brand:  "Dodge"   )
audi     = Car.new(size: 15, price: 30,  brand:  "Audi"    )
cars = [jaguar, mercedes, dodge, audi]


# Initialize ParkingLog
parking_lot = ParkingLot.new(spots)

# Find the first spot able to fit the Audi
p parking_lot.first_available_spot(audi)

# Return the combination of cars that fit and
# maximize profit for the special spot

p parking_lot.select_for_multispot(cars).map(&:brand)
