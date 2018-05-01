class ParkingLot
  attr_accessor :spots

  def initialize(spots)
    @spots = spots
  end

  def first_available_spot(car)
    spots.sort_by(&:floor).reject(&:taken).reject { |spot| spot.size < car.size }.first
  end
end
