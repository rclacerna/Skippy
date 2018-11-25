class Kangaroo
# todo make die directions enum
# todo make die as it's own class



  POINT = {
      'x_position' => 2,
      'y_position' => 2
  }

  def initialize(grid_dimension)
    @num_of_hops, @num_of_throws = 0

    @direction = Hash.new 0
    @grid_dimension = grid_dimension

    @current_position = {
       'x_position' => 0,
       'y_position' => 0
   }
  end

  def throw_die
    @num_of_throws += 1
    die(rand(3))
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


  def hop(x_coordinates , y_coordinates)
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
    x =  current_x_coord += hop_x_coord
    y = current_y_coord += hop_y_coord

   boundary = {
       lower_x => 0,
       lower_y => 0,
       upper_x => 1,
       upper_y => 1
   }

    if x < 0 || y < 0
        print("Oops, hit the boundary: (#{x}, #{y})")
        true
    end
  end

  def check_position(position)
    print("Hopped to: (#{position['x_position']}, #{position['y_position']})")

    if position == POINT
     print("Finished in #{@num_of_throws} hops!")
   end
  end

  def print(message)
    puts message
  end

  def count(side)
    @direction[side] += 1
  end


end


skippy = Kangaroo.new(4)

10.times do
  skippy.throw_die

end



=begin
@direction.each do |key, value|
  puts 'side: ' + key +' '+ 'number: ' + value.to_s
end
=end




