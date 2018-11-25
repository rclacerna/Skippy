class Kangaroo
  HOME_POSITION = {
      'x_position' => 9,
      'y_position' => 9
  }

  def initialize(grid_dimension)
    @num_of_hops = 0
    @num_of_throws = 0
    @direction = Hash.new 0
    @grid_dimension = grid_dimension
    @current_position = {  'x_position' => 0, 'y_position' => 0}
  end

  def throw_die
    @num_of_throws += 1
    die(rand(4))
  end

  def die(side)
    case side
      when 0
        count('North')
        hop(0, 1)
      when 1
        count('West')
        hop(1, 0)
      when 2
        count('South')
        hop(0, -1)
      when 3
        count('East')
        hop(-1, 0)
      else
        print("The side is not part of the die #{side}")
    end
  end


  def hop(x_coordinates, y_coordinates)
    current_x_coord = @current_position['x_position']
    current_y_coord = @current_position['y_position']

    if hit_grid_boundary(current_x_coord, current_y_coord, x_coordinates, y_coordinates)
      throw_die
    else

      @current_position['x_position'] += x_coordinates
      @current_position['y_position'] += y_coordinates

      @num_of_hops += 1
      check_position(@current_position)
    end
  end


  def hit_grid_boundary(current_x_coord, current_y_coord, hop_x_coord, hop_y_coord)
    x = current_x_coord += hop_x_coord
    y = current_y_coord += hop_y_coord

    if x < 0 || y < 0 || x > @grid_dimension['x'] -1 || y > @grid_dimension['y'] -1
      print("Oops, hit the boundary: (#{x}, #{y})")
      true
    end

  end

  def check_position(position)
    print("Hopped to: (#{position['x_position']}, #{position['y_position']})")

    if position == HOME_POSITION
      calculate_statistics
    end
  end

  def is_home(status = null)
    status
  end

  def print(message)
    puts message
  end

  def count(side)
    @direction[side] += 1
  end

  def calculate_statistics
    direction = @direction

    print(" - Finished in #{@num_of_hops} hops!")
    print(" - Total throws:: #{@num_of_throws}")

    direction.each do |key, value|
      percentage =  (value.to_f/@num_of_throws.to_f) * 100
      print(" -   #{key}: #{percentage.round(2)}%")
    end
    abort
  end


end


grid = {'x' => 10, 'y' => 10}

skippy = Kangaroo.new(grid)

500.times do
  skippy.throw_die
end


