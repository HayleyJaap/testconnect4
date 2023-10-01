class Connect4GameController < ApplicationController
  #this method is needed for routing purposes, even though it is empty
  def home()
  end

  def play()

    #restarting the game?
    if params.key?(:play_again) && params[:play_again] == "yes"
      @game_board = Gameboard.initialize_board
      @current_player = session[:current_player]

    #player made a move
    elsif params.key?(:col)
      @current_player = session[:current_player]
      column = params[:col]
      @bad_input = false

      #input validation
      if !column.scan(/\D/).empty?
        @bad_input = true

      #we know input was a number so we can cast and check
      elsif column.to_i > 6 || column.to_i < 1
        @bad_input = true
      else
        #game logic in this part is:
        #create new checker, add to board, check win condition, alternate players
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

      #save the grid in an instance variable so that it can be displayed by the view
      @game_board = Gameboard.get_grid

    else
      #start the game for first time
      @game_board = Gameboard.initialize_board
      session[:current_player] = "Red"
      @current_player = session[:current_player]

    end

  end
end
