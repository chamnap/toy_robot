module ToyRobot
  class Robot
    attr_accessor :orientation, :position

    #   N
    # W   E
    #   S
    def self.orientations
      {
        north: { left: :west, right: :east, back: :south },
        west:  { left: :south, right: :north, back: :east },
        south: { left: :east, right: :west, back: :north },
        east:  { left: :north, right: :south, back: :west }
      }
    end

    #   N
    # W   E
    #   S
    def self.steps
      {
        north: { x: 0, y: 1 },
        south: { x: 0, y: -1 },
        west:  { x: -1, y: 0 },
        east:  { x: 1, y: 0 }
      }
    end

    def face(orientation)
      self.orientation = orientation
    end

    def left
      face(orientations[orientation][:left])
    end

    def right
      face(orientations[orientation][:right])
    end

    def back
      face(orientations[orientation][:back])
    end

    def place(x, y)
      self.position = { x: x, y: y } if valid_position?(x, y)
    end

    def report_position
      "#{position[:x]},#{position[:y]}"
    end

    def move
      new_x = position[:x] + step[:x]
      new_y = position[:y] + step[:y]
      place(new_x, new_y) if valid_position?(new_x, new_y)
    end

    def on_table?
      !!position
    end

    def valid_position?(x, y)
      x >= 0 && x <=4 && y >=0 && y <= 4
    end

    def step
      steps[orientation]
    end

    private

    def orientations
      self.class.orientations
    end

    def steps
      self.class.steps
    end
  end
end
