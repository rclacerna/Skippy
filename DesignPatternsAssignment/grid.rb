#
# Author: Ryan Lacerna
#

class Grid
  attr_accessor :grid_dimension

  def hit_boundary?(current_x_coord, current_y_coord, hop_x_coord, hop_y_coord)
    x = current_x_coord += hop_x_coord
    y = current_y_coord += hop_y_coord

    if x.to_i < 0 || y.to_i < 0 || x > grid_dimension['x'] -1 || y > grid_dimension['y'] -1
      p "Oops, hit the boundary: (#{x}, #{y})"
      true
    end
  end
end