require_relative 'table'

class Robot

  attr_reader :position, :vector

  def initialize(table)
    @table = table
  end

  def place(position_x, position_y, vector)    	
    if @table.valid_vector?(vector)
      print vector
      @vector = vector
      move_to(position_x.to_i, position_y.to_i)
    else
      print "Wrong coordinates"
    end
  end


  def step_forward
    move_to(@position.send(@facing.downcase)) if placed?
  end

  def left
    clockwise_turn(-1)
  end

  def right
    clockwise_turn(1)
  end

  def location 
    "#{@position},#{@facing}" if placed?
  end

  def placed?
    !(@position.nil?)
  end

  def clockwise_turn(steps)
    index = FACINGS.index(@facing)
    @facing = FACINGS.rotate(steps)[index] if placed?
  end

  private

  def move_to(position_x, position_y) 
    print position_x
    if @table.inside_table?(position_x, position_y)
      # to do  
      print "Can be moved"
      print position_y
    else
      print "Wrong coordinates"
    end
  end

end
