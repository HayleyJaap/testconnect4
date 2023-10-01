class Checker
  #this represents a single checker
  #attributes: coordinates of location on grid, color (red or yellow)
  # TO DO: figure out how to calculate row that checker is in

  def initialize(color, column)
    @location = [nil, column]
    @color = color
    if color == "Red"
      @number = "-1"
    else
      @number = "1"
    end
  end

  def get_location
    return @location
  end

  def get_color
    return @color
  end

  def get_number
    return @number
  end


  def set_row(row)
    @location[0] = row
  end

end #checker
