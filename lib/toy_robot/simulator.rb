module ToyRobot
  # Simulator
  class Simulator
    attr_reader :robot

    def initialize(_robot = nil)
      @robot = Robot.new
    end

    def execute(instruction)
      return if instruction.strip.empty?
      command   = instruction.split(' ').first
      arguments = instruction.split(' ').last

      if command == 'PLACE'
        array = arguments.split(',')
        raise CommandError, 'Invalid arguments for PLACE.' if array.length != 3

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
        raise CommandError, "Invalid `#{command}` command, (PLACE,MOVE,LEFT,RIGHT,REPORT)."
      end
    end

    def place(x, y, orientation)
      raise CommandError, 'Invalid orientation (NORTH,SOUTH,EAST,WEST).' unless %w(north south east west).include?(orientation.to_s)
      raise CommandError, 'Invalid position, it makes the robots fall off the table.' unless robot.valid_position?(x, y)

      robot.face(orientation)
      robot.place(x, y)
      nil
    end

    def move
      raise CommandError, 'Robot is not placed on the table yet.' unless robot.on_table?
      raise CommandError, 'Invalid position, it makes the robots fall off the table.' unless robot.move

      nil
    end

    def left
      raise CommandError, 'Robot is not placed on the table yet.' unless robot.on_table?
      robot.left
      nil
    end

    def right
      raise CommandError, 'Robot is not placed on the table yet.' unless robot.on_table?
      robot.right
      nil
    end

    def report
      "#{robot.position[:x]},#{robot.position[:y]},#{robot.orientation.to_s.upcase}"
    end
  end
end
