module ToyRobot
  class Robot
    attr_accessor :orientation

    def self.orientations
      {
        north: { left: :west, right: :east, back: :south },
        west:  { left: :south, right: :north, back: :east },
        south: { left: :east, right: :west, back: :north },
        east:  { left: :north, right: :south, back: :west }
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

    private

    def orientations
      self.class.orientations
    end
  end
end
