#
# Author: Ryan Lacerna
#

require_relative 'kangaroo'
require_relative 'die'
require_relative 'grid'

class Factory

  def new_kangaroo
    Kangaroo.new
  end

  def new_die
    Die.new
  end

  def new_grid
    Grid.new
  end

  def new_hash
    Hash.new 0
  end

  def new_hash_coordinates
    @coord = {  'x' => 0, 'y' => 0}
  end

end