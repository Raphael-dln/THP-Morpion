require 'bundler'
Bundler.require

require_relative 'board_case'

class Board
#TO DO : la classe a 1 attr_accessor : un array/hash qui contient les BoardCases.
  #Optionnellement on peut aussi lui rajouter un autre sous le nom @count_turn pour compter le nombre de coups joué
  attr_accessor :a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3
  @@cases_array = []
  
  def initialize
    #Quand la classe s'initialize, elle doit créer 9 instances BoardCases
    #Ces instances sont rangées dans un array/hash qui est l'attr_accessor de la classe
    @a1 = BoardCase.new("A1", "")
    @a2 = BoardCase.new("A2", "")
    @a3 = BoardCase.new("A3", "")
    @b1 = BoardCase.new("B1", "")
    @b2 = BoardCase.new("B2", "")
    @b3 = BoardCase.new("B3", "")
    @c1 = BoardCase.new("C1", "")
    @c2 = BoardCase.new("C2", "")
    @c3 = BoardCase.new("C3", "")
    
  end
  
  def get_cases_array
    @@cases_array = [@a1, @a2, @a3,@b1, @b2, @b3, @c1, @c2, @c3]
    return @@cases_array 
  end














  
  

#binding.pry
end # Boar

#moi = Board

  

 
