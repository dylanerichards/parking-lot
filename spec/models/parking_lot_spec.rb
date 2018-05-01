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
end
