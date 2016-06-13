require 'spec_helper'

module ToyRobot
  describe Simulator do
    let(:simulator) { described_class.new }

    context '#execute' do
      it 'PLACE' do
        simulator.execute('PLACE 1,1,SOUTH')

        expect(simulator.report).to eq('1,1,SOUTH')
      end

      it 'MOVE raise CommandError before PLACE' do
        expect {
          simulator.execute('MOVE')
        }.to raise_error(CommandError, /not placed/)
      end

      it 'MOVE after PLACE' do
        simulator.execute('PLACE 1,1,SOUTH')
        simulator.execute('MOVE')

        expect(simulator.report).to eq('1,0,SOUTH')
      end

      it 'LEFT raise CommandError before PLACE' do
        expect {
          simulator.execute('LEFT')
        }.to raise_error(CommandError, /not placed/)
      end

      it 'LEFT after PLACE' do
        simulator.execute('PLACE 1,1,SOUTH')
        simulator.execute('LEFT')

        expect(simulator.report).to eq('1,1,EAST')
      end

      it 'RIGHT raise CommandError before PLACE' do
        expect {
          simulator.execute('RIGHT')
        }.to raise_error(CommandError, /not placed/)
      end

      it 'RIGHT after PLACE' do
        simulator.execute('PLACE 1,1,SOUTH')
        simulator.execute('RIGHT')

        expect(simulator.report).to eq('1,1,WEST')
      end
    end

    context 'integration' do
      it 'example1' do
        simulator.execute('PLACE 0,0,NORTH')
        simulator.execute('MOVE')

        expect(simulator.execute('REPORT')).to eq('0,1,NORTH')
      end

      it 'example2' do
        simulator.execute('PLACE 0,0,NORTH')
        simulator.execute('LEFT')

        expect(simulator.execute('REPORT')).to eq('0,0,WEST')
      end

      it 'example3' do
        simulator.execute('PLACE 1,2,EAST')
        simulator.execute('MOVE')
        simulator.execute('MOVE')
        simulator.execute('LEFT')
        simulator.execute('MOVE')

        expect(simulator.execute('REPORT')).to eq('3,3,NORTH')
      end
    end
  end
end
