require_relative 'table'

class Robot

  attr_reader :x_position, :y_position, :vector

  def initialize(table)
    @table = table
  end

  def place(position_x, position_y, vector)    	
    if @table.valid_vector?(vector)
      @x_position = position_x
      @y_position = position_y
      @vector = vector
      move_to(position_x.to_i, position_y.to_i)
    else
      print "Wrong coordinates"
    end
  end


  def move
    #todo
  end

  def left
    #todo
  end

  def right
    #todo
  end

  def location 
    "#{@x_position}, #{@y_position}, #{@vector}" if placed?
  end

  def placed?
    !(@vector.nil?)
  end


  private

  def move_to(position_x, position_y) 
    if @table.inside_table?(position_x, position_y)
      # to do  

    else
      print "Wrong coordinates"
    end
  end

end
