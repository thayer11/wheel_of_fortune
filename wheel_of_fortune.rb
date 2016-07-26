class WheelOfFortune
attr_reader :theme, :guesses, :phrase
  
  def initialize(hash) 
    @theme = hash[:theme]
    @phrase = hash[:phrase]
    @guesses = []
  end
  
  def to_s
  return phrase
  end

  def can_i_have?(input)
    phrase_array = @phrase.downcase.chars
    # p phrase_array
    guesses.push(input)
    if phrase_array.include? input.downcase
      return true
    
    else
      return false 
    end
  end
 
  def game_over?
    nil
  end
end


# Checks to see if we executed this file from the command-line
# e.g. `ruby simple_jepordy.rb`
if __FILE__ == $0

  # DRIVER CODE
  j = WheelOfFortune.new( {theme: "card games", phrase: "Go fish"} )
  j.can_i_have?("g")
  j.can_i_have?("o")
  p j
  puts j # calls j.to_s

end
