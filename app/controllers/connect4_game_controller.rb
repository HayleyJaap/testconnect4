class Connect4GameController < ApplicationController
   #board is just an array of checkers
  #so this controller IS the gameboard
  #and the checkers will be a model
  #because ultimately the board is just the middleman
  #between the data (checkers) and the view
  def home()
  end

  def play()
    #this method gets called again when receiving params from user

    #ways this method gets called
    # 1) when the user presses the play button on the home page
    # that will get called with empty params?
    # 2) when the user enters the column that they want to drop a checker in
    # that will have params to parse

    if params.key?(:play_again) && params[:play_again] == "yes"
      @game_board = Gameboard.initialize_board
      @current_player = session[:current_player]

    elsif params.key?(:col)
      @current_player = session[:current_player]
      column = params[:col]
      @bad_input = false

      if !column.scan(/\D/).empty?
        #bad input
        @bad_input = true
      #we know input was a number so we can cast and check
      elsif column.to_i > 6 || column.to_i < 1
        @bad_input = true
      else
        checker = Checker.new(@current_player, column.to_i - 1)
        Gameboard.drop_checker(checker)

        @won = Gameboard.game_over?(checker)
        @winner = @current_player

        if @current_player == "Red"
          @current_player = "Yellow"
          session[:current_player] = "Yellow"
        else
          @current_player = "Red"
          session[:current_player] = "Red"
        end
      end

      @game_board = Gameboard.get_grid

    else
      #start for first time
      @game_board = Gameboard.initialize_board
      session[:current_player] = "Red"
      @current_player = session[:current_player]

    end

  end
end
