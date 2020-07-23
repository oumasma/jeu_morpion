

class Player   # Ce sont les joueurs d'une partie.
  attr_accessor :name, :symbol   # nom et valeur du joueur (X ou O).
 
  def initialize (name, symbol)  # règle son nom et sa valeur.
    @name = name
    @symbol = symbol
  end
end