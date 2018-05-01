class Car
  attr_accessor :brand, :size, :price

  def initialize(args={})
    @brand = args.fetch(:brand)
    @size = args.fetch(:size)
    @price = args.fetch(:price)
  end
end
