require 'bundler'
Bundler.require

require_relative 'board_case'

class Board
#TO DO : la classe a 1 attr_accessor : un array/hash qui contient les BoardCases.
  #Optionnellement on peut aussi lui rajouter un autre sous le nom @count_turn pour compter le nombre de coups joué
  attr_accessor :a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3
  @@cases_array = []
  @@cases_grid = []
  
  def initialize
    #Quand la classe s'initialize, elle doit créer 9 instances BoardCases
    #Ces instances sont rangées dans un array/hash qui est l'attr_accessor de la classe
    @a1 = BoardCase.new("A1", " ")
    @a2 = BoardCase.new("A2", " ")
    @a3 = BoardCase.new("A3", " ")
    @b1 = BoardCase.new("B1", " ")
    @b2 = BoardCase.new("B2", " ")
    @b3 = BoardCase.new("B3", " ")
    @c1 = BoardCase.new("C1", " ")
    @c2 = BoardCase.new("C2", " ")
    @c3 = BoardCase.new("C3", " ")
  end
  
  def get_cases_array
    @@cases_array = [@a1, @a2, @a3,@b1, @b2, @b3, @c1, @c2, @c3]
    return @@cases_array 
  end

  def get_grid #pour le faire apparaitre moi.board.get_cases_array
    @@cases_grid = [[@a1, @a2, @a3],[@b1, @b2, @b3], [@c1, @c2, @c3]]
    return @@cases_grid
  end

  def show_game
    get_grid
    top
    puts "" 
    n = 65.chr
    puts "        1         2         3"
    @@cases_grid.each do |x|
      puts "    --------- --------- ---------"
      puts " #{n} |    #{x[0].content}    |    #{x[1].content}    |    #{x[2].content}    |"
      n = ("#{n}".ord + 1)
      n = n.chr
    end
    puts "    --------- --------- ---------"
  end

  def start
    system "clear"
  end

  def top
    puts "|///////////////////////////////////////////////////////////////|"
    puts "|                        Bienvenue sur                          |"
    puts "|                          'MORPION'                            |"
    puts "|                            1 VS 1                             |"
    puts "|///////////////////////////////////////////////////////////////|"
  end 
end # Board


  

 
