class TicTacToe
  def initialize()
    @board = [" "," "," "," "," "," "," "," "," "]
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
    
  def display_board
    separator = "-----------"
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts separator
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts separator
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    index = user_input.to_i - 1
  end
  
  def move(index, current_player="X")
    @board[index] = current_player
  end
  
  def position_taken?(index)
    if @board[index] != " " && @board[index] != ""
      return true
    end
  end
  
  def valid_move?(index)
    if index.between?(0,9)
      if !position_taken?
        return true
      end
    end
  end
  
  def turn
    puts "Please enter a number between 1 and 9"
    user_input = gets.strip
    input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    num_of_turns = 0
    @board.each do |space|
      if space == "X" || space == "O"
        num_of_turns += 1
      end
    end
    return num_of_turns
  end
  
  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end
end