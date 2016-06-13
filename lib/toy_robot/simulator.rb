module ToyRobot
  class Simulator
    attr_reader :robot

    def initialize(robot=nil)
      @robot = Robot.new
    end

    def execute(instruction)
      return if instruction.strip.empty?
      command   = instruction.split(' ').first
      arguments = instruction.split(' ').last

      if command == 'PLACE'
        array = arguments.split(',')
        raise ArgumentError, 'Invalid arguments for PLACE' if array.length != 3

        place(array[0].to_i, array[1].to_i, array[2].to_s.downcase.to_sym)
      elsif command == 'MOVE'
        move
      elsif command == 'LEFT'
        left
      elsif command == 'RIGHT'
        right
      elsif command == 'REPORT'
        report
      else
        raise ArgumentError, "Invalid `#{command}` command, (PLACE,MOVE,LEFT,RIGHT,REPORT)."
      end
    end

    # array
    def place(x, y, orientation)
      robot.face(orientation)
      robot.place(x, y)
    end

    def move
      raise CommandError, 'Robot is not placed on the table yet.' unless robot.on_table?
      robot.move
    end

    def left
      raise CommandError, 'Robot is not placed on the table yet.' unless robot.on_table?
      robot.left
    end

    def right
      raise CommandError, 'Robot is not placed on the table yet.' unless robot.on_table?
      robot.right
    end

    def report
      "#{robot.position[:x]},#{robot.position[:y]},#{robot.orientation.to_s.upcase}"
    end
  end
end
