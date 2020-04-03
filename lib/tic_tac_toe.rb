require "pry"
class TicTacToe

  #constant with all the winning patterns for tic tact toe
  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #first column
    [1,4,7], #second column
    [2,5,8], #third column
    [0,4,8], #first diagonal
    [2,4,6], #second diagonal
  ]

  #initialize the board as a new array if the board doesnt already exist
  def initialize(board = nil)
   @board = board || Array.new(9, " ")
 end

#knows who is current player bc on even turns its X on odd turns its O
 def current_player
   turn_count % 2 == 0 ? "X" : "O"
 end

 def turn_count
   @board.count{|token| token == "X" || token == "O"}
 end

#displays the board
 def display_board
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
 end

#takes in the players move converts to an integer and adjusts for aray space
 def input_to_index(string)
   string.to_i - 1
 end

#puts the token (X or O) in given index
 def move(index,token)
   @board[index] = token
 end

#checks if position is taken in the board array
#returns flase if empty true if not empty
 def position_taken?(index)
   if @board[index] == " "
     false
   else
     true
   end
 end

 def valid_move?(index)
   if @board[index] == " " &&  index.between?(0,8)
     true
   else
     false
   end
 end

 def turn
   puts "Please input 1-9"
   string = gets.chomp
   index = input_to_index(string)
   if valid_move?(index)
     token = current_player
     move(index, token)
   else
    turn
   end
   display_board
 end

 def won?
   WIN_COMBINATIONS.each do |combo|
    index_0 = combo[0]
    index_1 = combo[1]
    index_2 = combo[2]

    position_1 = @board[index_0]
    position_2 = @board[index_1]
    position_3 = @board[index_2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return combo
    end
  end
  return false
 end

 def full?
   @board.all? {|index| index == "X" || index == "O"}
 end

 def draw?
   if full? && !won?
     true
   else
     false
 end
 end

end
