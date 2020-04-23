require 'bundler'
Bundler.require

  #TO DO : la classe a 2 attr_accessor, sa valeur en string (X, O, ou vide), 
  # ainsi que son identifiant de case

class BoardCase
  attr_accessor :position, :content

  def initialize(case_position, case_content)
    @position = case_position #= position
    @content = case_content #= is_empty

  end

end