class WheelOfFortune
  attr_reader :guesses, :theme

  def initialize(game_hash)
    @theme = game_hash[:theme]
    @phrase = game_hash[:phrase]
    @guesses = []
    if @phrase
      @answer_array = @phrase.gsub(/\w/, '_').chars
      @letters_to_guess = @phrase.gsub(/\s/, '').length
    end
  end

  def to_s
    @answer_array.join
  end

  def can_i_have?(input)
    formatted_input = input.downcase
    @guesses.push formatted_input
    phrase_array = @phrase.downcase.chars
    if phrase_array.include? formatted_input
      index = phrase_array.find_index formatted_input    
      @answer_array[index] = @phrase[index]
      @letters_to_guess -= 1 
      return true
    else 
      return false
    end 
  end

  def game_over?
    @letters_to_guess == 0
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
