class Die
  attr_accessor :skippy

  def initialize
    @direction = Hash.new 0
    @num_of_throws = 0
  end

  def roll
    @num_of_throws += 1
    direction(rand(4))
  end

  def direction(side)
    case side
      when 0
        count('North')
        skippy.hop(0, 1)
      when 1
        count('West')
        skippy.hop(1, 0)
      when 2
        count('South')
        skippy.hop(0, -1)
      when 3
        count('East')
        skippy.hop(-1, 0)
      else
        p "The side is not part of the direction #{side}"
    end
  end

  def count(side)
    @direction[side] += 1
  end
  
end