require_relative 'factory'

  class Main

    def initialize
      factory = Factory.new

      @skippy = factory.new_kangaroo
      @dice = factory.new_die
      @grid = factory.new_grid

      # apply dependencies
      @grid.grid_dimension = user_input_dimensions
      @grid.dice = @dice

      @dice.skippy = @skippy

      @skippy.grid = @grid
      @skippy.dice = @dice

    end

    def start
        @dice.roll

        if @grid.home == true
          calculate_statistics
          abort
        else
          @dice.roll
        end

    end

    def user_input_dimensions
      p "Please enter the size of 'x' of your grid >= 1"
      x = gets
      p "Please enter the size of 'y' of your grid => 1"
      y = gets

      @dimension = {'x' => x.to_i, 'y' => y.to_i}
    end

    def calculate_statistics
      direction = @direction

      p " - Finished in #{@num_of_hops} hops!"
      p ""
      p " - Total throws:: #{@num_of_throws}"

      direction.each do |key, value|
        percentage =  (value.to_f/@num_of_throws.to_f) * 100
        print(" -   #{key}: #{percentage.round(2)}%")
      end
    end
  end


program = Main.new
program.start