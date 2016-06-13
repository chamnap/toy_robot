require 'toy_robot/version'

# ToyRobot
module ToyRobot
  autoload :Robot,        'toy_robot/robot'
  autoload :Simulator,    'toy_robot/simulator'
  autoload :CommandError, 'toy_robot/command_error'
end
