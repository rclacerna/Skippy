#
# Author: Ryan Lacerna
#

class Die
  attr_accessor :skippy, :num_of_hops

  def initialize
    @die_face = Hash.new 0
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
    @die_face[side] += 1
  end

  def calculate_die_statistics
    p " - Finished in #{num_of_hops} hops!"
    p " - Total throws:: #{@num_of_throws}"

    @die_face.each do |key, value|
      percentage = (value.to_f/@num_of_throws.to_f) * 100
      p " -   #{key}: #{percentage.round(2)}%"
    end
  end

end