require_relative 'robot'
require_relative 'table'

class CommandProcessor

  VALID_COMMANDS = ["PLACE", "MOVE", "LEFT", "RIGHT", "REPORT"]  

  def initialize(robot, io = STDOUT)
    @table = Table.new
    @robot = robot
    @io = io
  end

  def process(command)
    command = create(command)
    # command.execute
  end

  def place_command_proceed
    @robot.place(@x_position.to_i, @y_position.to_i, @vector.to_s)
    print "Placing vector to: "
    puts @vector	
  end

  def create(command)
    # remember the command
    #initial_command = command.dup 

    if is_place_command?(command)
      place_command_proceed
    elsif valid_command?(command)
      #command_proceed(command) 
    else	
      puts "Wrong command. Try again"
    end

  end

  private
  
  def valid_command?(com)
    VALID_COMMANDS.include?(com)
  end  

  def is_place_command?(com)
      com.slice!('PLACE ')
      @x_position, @y_position, @vector =  com.split(",")
      @table.inside_table?(@x_position.to_i, @y_position.to_i) && @table.valid_vector?(@vector.to_s)
  end


end
