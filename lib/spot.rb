class Spot
  attr_accessor :floor, :size, :taken

  def initialize(args={})
    @floor = args.fetch(:floor)
    @size = args.fetch(:size)
    @taken = args.fetch(:taken, false)
  end
end
