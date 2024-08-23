list = File.read('google-10000-english-no-swears.txt').split("\n")
dictionary = []

list.each do |word|
  if word.length >= 5 && word.length <= 12
    dictionary.push(word)
  end
end # generate list of words between 5 and 12 in length.

secret_word = dictionary[rand(dictionary.length - 1)]

display = []
secret_word.length.times {|i| display.push('_ ')}
incorrect = ""


def progress(secret_word, display, incorrect)
  
  
  puts secret_word
  puts display.join
  puts "Incorrect guesses: #{incorrect}"
  
  guess = gets.chomp

  secret_array = secret_word.split("")

  if secret_word.include?(guess)
    secret_array.each_index{|index|
      if secret_array[index] == guess
        display[index] = "#{guess} "
      end
    }
    if display.join.gsub(" ", "") == secret_word 
      puts display.join
      puts "Yay! You have guessed the word!"
    else
      puts display.join
      progress(secret_word, display, incorrect)
    end
    
  else
    incorrect << "#{guess}, "
    progress(secret_word, display, incorrect)
  end
  
  # if secret_word.include?(guess) == false
    
  #   puts 'Incorrect word or letter. Please try again'
  #   incorrect << guess
  #   puts incorrect

  #   progress(secret_word, display)
  # elsif guess.length == 1 && secret_word.include?(guess)
  #   display[secret_word.index(guess)] = "#{guess} "
  #   progress(secret_word, display)
  # end

end

progress(secret_word, display, incorrect)

# input = gets.chomp
# word = 'fat'
# puts word << input
# puts word