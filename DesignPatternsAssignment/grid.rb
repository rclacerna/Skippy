HOME_POSITION ={
    'x' => 3,
    'y' => 3
}

class Grid
  attr_accessor :grid_dimension, :dice

  def initialize
    @reached_home = false
  end

  def hit_boundary?(current_x_coord, current_y_coord, hop_x_coord, hop_y_coord)
    x = current_x_coord += hop_x_coord
    y = current_y_coord += hop_y_coord

    if x < 0 || y < 0 || x > grid_dimension['x'] -1 || y > grid_dimension['y'] -1
      p "Oops, hit the boundary: (#{x}, #{y})"
      true
    else
      false
    end
  end

  def check_position(position)
    if position == HOME_POSITION
      @reached_home = true
    end

  end

  def home
    @reached_home
  end

end