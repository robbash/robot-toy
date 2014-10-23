class Robot < ActiveRecord::Base
  FACING = [ North = 0, East = 1, South = 2, West = 3 ]

  attr_reader :xbounds, :ybounds

  after_initialize :default_values

  def place x, y, f
    unless x >= @xbounds || y >= @ybounds || !FACING[f]
      self.pos_x = x
      self.pos_y = y
      self.facing = f

      true
    else
      false      
    end
  end

  def move?
    if self.facing === North && self.pos_y < @ybounds - 1
      # puts 'Moving north'
      self.pos_y += 1
    elsif self.facing === East && self.pos_x < @xbounds - 1
      # puts 'Moving east'
      self.pos_x += 1
    elsif self.facing === South && self.pos_y > 0
      # puts 'Moving south'
      self.pos_y -= 1
    elsif self.facing === West && self.pos_x > 0
      # puts 'Moving west'
      self.pos_x -= 1
        
    else
      puts 'No moving possible!'

      false
    end
  end

  def left?
    turn? -1
  end

  def right?
    turn? 1
  end

  def report
    rep = "Current position:\n  x = #{self.pos_x};\n  y = #{self.pos_y},\n  heading: #{get_direction}"
    # puts rep
    rep
  end

  def get_direction
    Robot.constants.find{ |name| Robot.const_get(name) == self.facing }
  end

private

  def default_values
    @xbounds = 5
    @ybounds = 5
  end

  def turn? steps
    self.facing = ( self.facing + steps ) % 4
  end

end
