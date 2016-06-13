require 'spec_helper'

module ToyRobot
  describe Robot do
    let(:robot) { described_class.new }

    context '#left' do
      it 'facing north' do
        robot.face(:north)
        robot.left

        expect(robot.orientation).to eq(:west)
      end

      it 'facing west' do
        robot.face(:west)
        robot.left

        expect(robot.orientation).to eq(:south)
      end

      it 'facing south' do
        robot.face(:south)
        robot.left

        expect(robot.orientation).to eq(:east)
      end

      it 'facing east' do
        robot.face(:east)
        robot.left

        expect(robot.orientation).to eq(:north)
      end
    end

    context '#right' do
      it 'facing north' do
        robot.face(:north)
        robot.right

        expect(robot.orientation).to eq(:east)
      end

      it 'facing west' do
        robot.face(:west)
        robot.right

        expect(robot.orientation).to eq(:north)
      end

      it 'facing south' do
        robot.face(:south)
        robot.right

        expect(robot.orientation).to eq(:west)
      end

      it 'facing east' do
        robot.face(:east)
        robot.right

        expect(robot.orientation).to eq(:south)
      end
    end

    context '#back' do
      it 'facing north' do
        robot.face(:north)
        robot.back

        expect(robot.orientation).to eq(:south)
      end

      it 'facing west' do
        robot.face(:west)
        robot.back

        expect(robot.orientation).to eq(:east)
      end

      it 'facing south' do
        robot.face(:south)
        robot.back

        expect(robot.orientation).to eq(:north)
      end

      it 'facing east' do
        robot.face(:east)
        robot.back

        expect(robot.orientation).to eq(:west)
      end
    end
  end
end
