require "spec_helper"
require "spot"
require "parking_lot"
require "car"

describe "ParkingLot" do
  describe "#first_available_spot" do
    it "returns the first parking spot in which an incoming vehicle can park" do
      spot1 = Spot.new(floor: 1, size: 10)
      spot2 = Spot.new(floor: 1, size: 20, taken: true)
      spot3 = Spot.new(floor: 2, size: 20)

      parking_lot = ParkingLot.new([spot1, spot2, spot3])

      car = Car.new(brand: "Dodge", size: 15, price: 50)

      expect(parking_lot.first_available_spot(car)).to eq spot3
    end
  end

  describe "#select_for_multispot" do
    it "determines the best combination of vehicles to fit in the special parking spot to optimize profit" do
      jaguar   = Car.new(size: 45, price: 170, brand: "Jaguar"   )
      mercedes = Car.new(size: 10, price: 100, brand: "Mercedes" )
      dodge    = Car.new(size: 15, price: 50,  brand:  "Dodge"   )
      audi     = Car.new(size: 15, price: 30,  brand:  "Audi"    )

      parking_lot = ParkingLot.new([Spot.new(floor: 1, size: 10)])

      selection = parking_lot.select_for_multispot([dodge, jaguar, mercedes, audi])

      expect(selection).to eq [dodge, mercedes, audi]
    end
  end
end
