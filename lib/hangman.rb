require "yaml"

display = []
incorrect = []
dictionary = []

list = File.read('google-10000-english-no-swears.txt').split("\n")
list.each do |word|
  if word.length >= 5 && word.length <= 12
    dictionary.push(word)
  end
end 
# generate list of words between 5 and 12 in length.

secret_word = dictionary[rand(dictionary.length - 1)]
# randomly select a word between 5 and 12 in length.

class Play
  
  def initialize(secret_word, incorrect, display)
    @secret_word = secret_word
    @incorrect = incorrect
    @display = display
  end

  def start()
    @secret_word.length.times {|i| @display.push('_ ')}
    puts @display.join
    progress()
  end

  def progress()
    puts @secret_word
    puts "Incorrect guesses: #{@incorrect}"
  
    guess = gets.chomp

    secret_array = @secret_word.split("")

    if @secret_word.include?(guess)
      secret_array.each_index{|index|
        if secret_array[index] == guess
          @display[index] = "#{guess} "
        end
      }
      if @display.join.gsub(" ", "") == @secret_word 
        puts @display.join
        puts "Yay! You have guessed the word!"
      else
        puts @display.join
        progress()
      end
      
    else
      @incorrect << guess
      if @incorrect.length == 7
        puts "Oh no, you're out of guesses!"
      else
      progress()
      end
    end
  end

end

show = Play.new(secret_word, incorrect, display)
show.start()
