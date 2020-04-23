require 'bundler'
Bundler.require

require_relative 'player'
require_relative 'board_case'
require_relative 'board'

class Game
  attr_accessor :player1, :player2, :board

  def initialize
    # On démarre le jeu : création des joueurs et du morpion
    puts "Eh toi, dis-moi comment tu t'appelles (X)"
    print "> "
    name_player1 = gets.chomp
    @player1 = Player.new("#{name = name_player1}", "#{symbol = "X"}")
    sleep(2)
    puts "Super ! L'autre à côté, file-moi ton blase aussi (O)"
    print "> "
    name_player2 = gets.chomp
    @player2 = Player.new("#{name = name_player2}", "#{symbol = "O"}")
    puts "Bienvenue dans ce morpion #{name_player1} et #{name_player2}"
    @board = Board.new
 
  end #initialize
  
  def go
    # On lance la partie, 
    puts " #{player1.player_name} va jouer le premier"
    sleep (2)
    play_turn #On fait appel à la méthode play_turn ci-dessous
  end

  def play_turn
    #1) demande au bon joueur ce qu'il souhaite faire
    #2) change la BoardCase jouée en fonction de la valeur du joueur (X ou O)
    turn = 1
    while turn < 10 do
      if turn >9 ################################# ajout en début de boucle de vérifier qu'on dépasse pas 9 tour
        puts "La partie est terminée bande de nazes"
        break
      else
        if turn.odd? 
          puts "C'est ton tour #{player1.player_name}, que souhaites-tu jouer ?"
          print ">"
          next_move = gets.chomp
         @board.get_cases_array.each do |x|
           if x.position == next_move
              if x.content == ""
                x.content = "#{player1.player_symbol}"
                if victory == true #################################### condition victoire p1
                  puts "#{player1.player_name} a remporté la partie !"
                  break
                end                #################################### condition victoire p1
              else
                puts "Tricheur, la case est déjà renseignée"
                turn -=1 # On veut rejouer le tour
              end
            end
          end 
        else
          puts "C'est ton tour #{player2.player_name}, essayes de gagner cette fois !"
          print ">"
          next_move = gets.chomp
          @board.get_cases_array.each do |x|
            if x.position == next_move
              if x.content == ""
                x.content = "#{player2.player_symbol}" 
                if victory == true #################################### condition victoire p2
                  puts "#{player2.player_name} a remporté la partie !"
                  break
                end                #################################### condition victoire p2
              else
                puts "Tricheur, la case est déjà renseignée"
                turn -= 1 
              end
            end
          end
        end
        turn += 1
      end
    end # boucle while
    return turn
  end # play_turn


  def victory

    #TO DO : une méthode qui vérifie le plateau et indique s'il y a un vainqueur ou match nul
    # check ici : https://www.rubyguides.com/2017/10/ruby-transpose-method/
    if
      @board.get_grid.each { |row| return row.first if all_equal?(row) }
    elsif
      @board.get_grid
        .transpose
        .each { |row| return row.first if all_equal?(row) }
    else
      diagonals = [
        [@board.get_grid[0][0], @board.get_grid[1][1], @board.get_grid[2][2]],
        [@board.get_grid[0][2], @board.get_grid[1][1], @board.get_grid[2][0]]
      ]
      diagonals.each { |row| return row.first if all_equal?(row) }
    end
   return true
  end #victory?
  
  def all_equal?(row) # def de all_equal pour la def victory (ligne 92 96 et 102)
    return if row.first == nil
    row.each_cons(2).all? { |x,y| x == y }
  end

  def perform
    creation_players
    play_turn
  end

  binding.pry
end # end Game

#new_app = Game.new
#new_app.perform
