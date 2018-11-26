class Kangaroo
  attr_accessor :grid, :dice

  def initialize
    @num_of_hops = 0
    @current_position = {  'x' => 0, 'y' => 0}
  end


  def hop(x_coordinates, y_coordinates)
    current_x_coord = @current_position['x']
    current_y_coord = @current_position['y']

    if grid.hit_boundary?(current_x_coord, current_y_coord, x_coordinates, y_coordinates)
      dice.roll
    else
      @current_position['x'] += x_coordinates
      @current_position['y'] += y_coordinates
      @num_of_hops += 1
      p "Hopped to: (#{@current_position['x']}, #{@current_position['y']})"
      grid.check_position(@current_position)
    end
  end
end

