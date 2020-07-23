
class Board       # c'est le plateau de jeu.
  attr_accessor :boardcases_array, :choice_case 
  
	def initialize     # Quand la classe s'initialize, elle doit créer 9 instances BoardCases
    @board =  [*0..8].map { |i|  BoardCase.new(i).case_id } # 0 compte dans les index
	end

  def to_s     # on affiche le plateau
    puts "       #{@board[0..2].join(" | ")}"
    puts "       --|---|--"
    puts "       #{@board[3..5].join(" | ")}"
    puts "       --|---|--"
    puts "       #{@board[6..8].join(" | ")}"
  end

  def play_turn(symbol)     # une methode qui change la BoardCase jouée en fonction de la valeur du joueur (X ou O) 
    case_id= gets.chomp().to_i   #  le joueur choisit une case
    @board = @board.each_index.map { |e| e == case_id && @board[e] != "X" && @board[e] != "_" ? @board[e] = symbol : @board[e] }
  end

  def victory?   # qui gagne ? on teste si les combinaisons gagnantes
    if (@board[0] == @board[1] && @board[0] == @board[2]) || (@board[3] == @board[4] && @board[3] == @board[5]) || (@board[6] == @board[7] && @board[6] == @board[8] ) || (@board[0] == @board[3] && @board[0] == @board[6]) || (@board[1] == @board[4] && @board[1] == @board[7]) || (@board[2] == @board[5] && @board[2] == @board[8]) ||( @board[0] == @board[4] && @board[0] == @board[8]) || (@board[2] == @board[4] && @board[2] == @board[6])
      return true
    else
      return false
    end
  end
end