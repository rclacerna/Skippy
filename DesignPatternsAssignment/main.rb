#
# Author: Ryan Lacerna
#

require_relative 'factory'

class Main

  def initialize
    factory = Factory.new

    @skippy = factory.new_kangaroo
    @dice = factory.new_die
    @grid = factory.new_grid
    @current_position = factory.new_hash_coordinates
    @home_position = {'x' => 2, 'y' => 2}

    # apply dependencies

    @grid.grid_dimension = user_input
    @dice.skippy = @skippy
    @skippy.grid = @grid
    @skippy.home_position = @home_position
    @skippy.current_position = @current_position
    @skippy.num_of_hops = 0
    @skippy.dice = @dice
  end

  def start
    @dice.roll

    if @skippy.check_is_home?
      @dice.num_of_hops = @skippy.num_of_hops
      @dice.calculate_die_statistics
      exit
    end
  end

  def user_input
    p 'Please enter size of X of grid >= 1'
    x = gets
    p 'Please enter size of Y of grid >= 1'
    y = gets

    if x.to_i <= 0 || y.to_i <= 0
      p 'You must enter integer values >= 1!!!!'
      user_input
    else
      @dimension = {'x' => x.to_i, 'y' => y.to_i}
    end
  end
end


program = Main.new
program.start