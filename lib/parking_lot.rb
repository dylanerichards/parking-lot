class ParkingLot
  attr_accessor :spots

  def initialize(spots)
    @spots = spots
  end

  def first_available_spot(car)
    spots.sort_by(&:floor).reject(&:taken).reject { |spot| spot.size < car.size }.first
  end

  def select_for_multispot(cars)
    spot_size = 50
    price = 0
    winning_combination = []

    combinations = (0..cars.length).flat_map{|size| cars.combination(size).to_a }
    under_50 = combinations[1..-1].select { |combination| combination.map(&:size).inject(&:+) <= 50  }

    under_50.each_with_index do |consideration|
      total = 0
      consideration.each { |car| total += car.price }

      winning_combination = consideration if price < total
      price = total if price < total
    end

    winning_combination
  end
end
