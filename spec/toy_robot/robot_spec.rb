require 'spec_helper'

module ToyRobot
  describe Robot do
    let(:robot) { described_class.new }
    before      { robot.place(0, 0) }

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

    context '#place with extact position' do
      it 'stand at 0,0 by default' do
        expect(robot.report_position).to eq('0,0')
      end

      it '#place at 0,0' do
        expect(robot.place(0, 0)).to eq(true)
        expect(robot.report_position).to eq('0,0')
      end

      it '#place at 4,0' do
        expect(robot.place(4, 0)).to eq(true)
        expect(robot.report_position).to eq('4,0')
      end

      it '#place at 0,4' do
        expect(robot.place(0, 4)).to eq(true)
        expect(robot.report_position).to eq('0,4')
      end

      it '#place at -1,0' do
        expect(robot.place(-1, 0)).to eq(false)
        expect(robot.report_position).to eq('0,0')
      end

      it '#place at 0,-1' do
        expect(robot.place(0, -1)).to eq(false)
        expect(robot.report_position).to eq('0,0')
      end

      it '#place at -1,-1' do
        expect(robot.place(0, -1)).to eq(false)
        expect(robot.report_position).to eq('0,0')
      end

      it '#place at -5,1' do
        expect(robot.place(-5, 1)).to eq(false)
        expect(robot.report_position).to eq('0,0')
      end

      it '#place at 1,-5' do
        expect(robot.place(1, -5)).to eq(false)
        expect(robot.report_position).to eq('0,0')
      end
    end

    context '#move' do
      it 'moves to north' do
        robot.face(:north)
        robot.move

        expect(robot.report_position).to eq('0,1')
      end

      it 'moves to east' do
        robot.face(:east)
        robot.move

        expect(robot.report_position).to eq('1,0')
      end

      it 'doesn\'t moves to south since it\'s off the table' do
        robot.face(:south)
        robot.move

        expect(robot.report_position).to eq('0,0')
      end

      it 'doesn\'t moves to west since it\'s off the table' do
        robot.face(:west)
        robot.move

        expect(robot.report_position).to eq('0,0')
      end
    end
  end
end
