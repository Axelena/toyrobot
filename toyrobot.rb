#!/usr/bin/env ruby

require_relative 'lib/robot'
require_relative 'lib/table'
require_relative 'lib/command_processor'

table = Table.new
robot = Robot.new(table)
command_processor = CommandProcessor.new(robot, table)
#instruction_processor = InstructionProcessor.new#(command_factory)

ARGF.each_line { |line| 
  command_processor.process(line.strip)	 
}