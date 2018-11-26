#
# Author: Ryan Lacerna
#

class Kangaroo
  attr_accessor :dice, :grid, :home_position, :current_position, :num_of_hops

  def hop(x_coordinates, y_coordinates)
    current_x_coord = current_position['x']
    current_y_coord = current_position['y']

    if grid.hit_boundary?(current_x_coord, current_y_coord, x_coordinates, y_coordinates)
      dice.roll
    else

      current_position['x'] += x_coordinates
      current_position['y'] += y_coordinates
      @num_of_hops += 1

      p "Hopped to: (#{current_position['x']}, #{current_position['y']})"

      check_is_home?
    end
  end

  def check_is_home?
    if current_position == home_position
      true
    else
      dice.roll
    end
  end

end

