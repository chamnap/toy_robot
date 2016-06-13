# ToyRobot

ToyRobot is a simulator of a robot that moves on a square tabletop, of dimensions 5 units x 5 units. Please checkout the [specification](https://github.com/chamnap/toy_robot/blob/master/SPEC.md) for more details.

## Installation

You should have ruby 2.3.0 installed on your machine. Then, run the following inside your console:

    $ git clone git://github.com/chamnap/toy_robot.git
    $ cd toy_robot
    $ gem install bundler
    $ bundle install

## Usage

ToyRobot reads instructions from STDIN, executing them one command at a time until you press ENTER key.

    $ cd toy_robot
    $ bin/toy_robot
    PLACE 1,2,EAST
    MOVE
    MOVE
    LEFT
    MOVE
    REPORT
    => 3,3,NORTH

## Tests

    $ rspec
    Run options: include {:focus=>true}

    All examples were filtered out; ignoring {:focus=>true}
    ...................................

    Finished in 0.01238 seconds (files took 0.39698 seconds to load)
    35 examples, 0 failures

    Coverage report generated for RSpec to /Users/chamnapchhorn/workspace/me/toy_robot/coverage. 126 / 127 LOC (99.21%) covered.

## Authors

* [Chamnap Chhorn](https://github.com/chamnap)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
