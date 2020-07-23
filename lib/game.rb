
class Game    # Cette classe s'occupe de gérer toute la partie.
  attr_accessor :players_array, :board, :current_player, :status

#les methodes : Game permet de jouer un tour (demande au joueur ce qu'il veut faire et rempli la case), s'occupe de finir la partie si un joueur a gagné et propose aux joueurs de faire une nouvelle partie ensuite.
  
  def initialize  # crée 2 joueurs, créé un board, met le status à "on going", défini un current_player
   
    system "clear"
    puts "="*100
    puts "        >>>>>>>>>>>>>>      Bienvenue au jeu du Tic Tac Toe!     <<<<<<<<<<<<<<<     "                                    
    puts"="*100
    puts "Attention, si tu choisis une case déjà occupée, tu perds ton tour!"
    puts
    puts "Joueur 1 symbole X quel est ton nom ? "
    print ">"
    name_1 = gets.chomp  #le joueur 1 entre son nom

    
    @player1 = Player.new(name_1, "X")   # crée le joueur 1
    puts
    puts "Joueur 2 symbole O, quel est ton nom ? "
    print ">"
    name_2 = gets.chomp 

    
    @player2 = Player.new(name_2, "O")  # crée le joueur 2
    @current_player = @player1

    
    @board = Board.new   # crée le plateau de jeu
  end

  def go   # on lance la partie
    
    while @board.victory? == false
      self.turn
    end
  end

  def switch_players  # Passe d'un joueur à l'autre
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  
  def turn   # à chaque tour on exécute turn (lancé par la méthode go)
    # On boucle tant qu'il n'y a pas de victoire
    loop do
      system "clear"
      puts "="*30

      puts "Voici l'état du jeu:"
      puts ""
      # Affiche le plateau :
      @board.to_s

      puts ""
      puts "C'est le tour de #{@current_player.name} avec les #{@current_player.symbol}"
      puts "Choisis une case"
      print ">"

      # On appelle la méthode de la classe board sur le joueur en cours (current). Elle demande au joueur quelle case il joue, puis affiche son symbole dans la case
      @board.play_turn(@current_player.symbol)

      # On arrête la boucle en cas de victoire
      if @board.victory? == true
        system "clear"
        puts "="*30
        puts "Voici l'état du jeu:"
        @board.to_s
        puts ""
        puts "     ,.-~*´¨¯¨`*·~-.¸-(_#{@current_player.name} a gagné !!!_)-,.-~*´¨¯¨`*·~-.¸   "
        puts ""
        puts "        (♥_♥)  Souhaitez-vous rejouer ? Relancez le programme  (♥_♥)   "
        break
      

      # Il n'y a pas de victoire : on passe au joueur suivant et on boucle (tour suivant)
      switch_players
      end
    end
  end 
end



