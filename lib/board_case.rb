
class BoardCase     # Case du jeu lors d'une partie.
	attr_accessor :content, :case_id  # valeur en string (X, O, ou vide), ainsi que son identifiant de case

	def initialize (case_id)  #  règle sa valeur, ainsi que son numéro de case.
    @case_id = case_id
    @content = ""
  end
end