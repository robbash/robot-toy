require 'test_helper'

class RobotTest < ActiveSupport::TestCase
  r = Robot.new

  test "init & place" do
    assert r.place( 2, 4, Robot::North ), 'Out of bounds or bad facing!'
    assert !r.place( 2, 6, Robot::East ), 'Not out of bounds!'
    assert !r.place( 2, 2, 5 ), 'No bad facing!'

    r.report
  end

  test "moving" do
    assert r.place( 2, 3, Robot::North ), 'Out of bounds or bad facing!'
    assert r.move?, 'Cannot move to prevent falling off table.'
    
    r.place 0, 1, Robot::West
    assert !r.move?, 'Should move here'
  end

  test "turning" do
    assert r.left?
    puts r.report
    assert r.left?
    puts r.report
    assert r.left?
    puts r.report
    assert r.left?
    puts r.report
    assert r.left?
    puts r.report
    assert r.left?
    puts r.report
  end

  test "examples" do
    # a)
    # PLACE 0,0,NORTH
    # MOVE
    # REPORT
    # Output: 0,1,NORTH
    puts "Test a)"
    r.place 0, 0, Robot::North
    r.move?
    puts r.report

    # b)
    # PLACE 0,0,NORTH
    # LEFT
    # REPORT
    # Output: 0,0,WEST
    puts "Test b)"
    r.place 0, 0, Robot::North
    r.left?
    puts r.report

    # c)
    # PLACE 1,2,EAST
    # MOVE
    # MOVE
    # LEFT
    # MOVE
    # REPORT
    # Output: 3,3,NORTH
    puts "Test c)"
    r.place 1, 2, Robot::East
    r.move?
    r.move?
    r.left?
    r.move?
    puts r.report

  end

end
