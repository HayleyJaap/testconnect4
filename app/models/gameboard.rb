class Gameboard
  #this class  represents the connecct 4 grid
  #which is 7 rows x 6 columns
  #methods: Add piece, check win condition
  @@grid = Array.new(7) { Array.new(6, 0)}

  # def initialize(arg)
  #   super
  #   @grid = Array.new(7) { Array.new(6, 0)}
  # end

  def self.get_grid
    return @@grid
  end

  def self.initialize_board
    @@grid = Array.new(7) { Array.new(6, 0)}
    return @@grid
  end

  def self.drop_checker(checker)
    #TO DO: Figure out how to 'drop' a checker in
    #we have the column
    #so perhaps use a for loop to iterate down that column until location != null

    column = (checker.get_location)[1]

    if @@grid[-1][column] == 0
      #if first checker in this column
      @@grid[-1][column] = checker.get_number
      checker.set_row(@@grid.length - 1)
    else

      for i in 0..@@grid.length - 1

        if @@grid[i][column] != 0
          @@grid[i - 1][column] = checker.get_number

          #add the row to the checker's location
          checker.set_row(i - 1)

          #fix this, bad logic
          break
        end

      end

    end

  end #drop_checker

  def self.game_over?(checker)
    won = false
    won = check_horizontal(checker)

    if !won
      won = check_vertical(checker)
    end

    if !won
      won = check_diagonal(checker)
    end

    return won
  end

  def self.check_horizontal(checker)
    row = checker.get_location[0]
    col = checker.get_location[1]
    won = false

    #loop for number of columns in a row
    for i in 0..@@grid[0].length - 4
      #red value = -1, yellow = 1 so we can add to check for a win
      connected = @@grid[row][i].to_i + @@grid[row][i + 1].to_i + @@grid[row][i + 2].to_i + @@grid[row][i + 3].to_i
      if connected == 4 || connected == -4
        won = true
      end
    end

    return won

  end

  def self.check_vertical(checker)
    row = checker.get_location[0]
    col = checker.get_location[1]
    won = false

    #loop for number of columns in a row
    for i in 0..@@grid.length - 4
      #red value = -1, yellow = 1 so we can add to check for a win
      connected = @@grid[i][col].to_i + @@grid[i + 1][col].to_i + @@grid[i + 2][col].to_i + @@grid[i + 3][col].to_i
      if connected == 4 || connected == -4
        won = true
      end
    end

    return won

  end

  def self.check_diagonal(checker)
    row = checker.get_location[0]
    col = checker.get_location[1]
    won = false

    #loop for number of columns in a row
    for i in 0..@@grid.length - 4
      for j in 0..@@grid[0].length - 4
        #red value = -1, yellow = 1 so we can add to check for a win
        connected = @@grid[i][j].to_i + @@grid[i + 1][j + 1].to_i + @@grid[i + 2][j + 2].to_i + @@grid[i + 3][j + 3].to_i
        if connected == 4 || connected == -4
          won = true
        end
      end
    end

    for i in 3..@@grid.length-1
      for j in 0..@@grid[0].length - 4
        #red value = -1, yellow = 1 so we can add to check for a win
        connected = @@grid[i][j].to_i + @@grid[i - 1][j + 1].to_i + @@grid[i - 2][j + 2].to_i + @@grid[i - 3][j + 3].to_i
        if connected == 4 || connected == -4
          won = true
        end
      end
    end

    return won

  end

end
