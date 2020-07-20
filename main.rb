require_relative "question.rb"
require_relative "player.rb"

@player1 = Player.new()
@player1.turn = true
@player2 = Player.new()

def use_custom_names
  puts "do you want to use custom names?\n(y)\n(n)"
  answer = gets.chomp
  if answer == "y"
    puts "Enter a name for Player 1"
    @player1.name = gets.chomp()
    puts "Enter a name for Player 2"
    @player2.name = gets.chomp()
  end
end

@turn_count = 0
use_custom_names()

def play
  @turn_count += 1
  
  
  if @player1.turn and @player1.check_lives and @player2.check_lives
    if @turn_count > 1
      puts "\n---- New Turn ----\n"
    end
    prompt = Question.new()
    @player1.turn = false
    @player2.turn = true
    puts "#{@player1.name}: #{prompt.prompt}"
    print "> "
    answer = gets.chomp()
    if answer.to_i == prompt.answer
      puts "\n#{@player1.name}: You got it!"
      puts "#{@player1.name}: #{@player1.lives}/3 vs Player 2: #{@player2.lives}/3"
    else
      @player1.lives -= 1
      puts "\n#{@player1.name}: Seriously? No!"
      puts "#{@player1.name}: #{@player1.lives}/3 vs Player 2: #{@player2.lives}/3"
    end
    play()
  elsif (@player2.turn and @player1.check_lives and @player2.check_lives) || (@player2.turn and @player2.lives == 1 and !@player1.check_lives)
    puts "\n---- New Turn ----\n"
    prompt = Question.new
    @player2.turn = false
    @player1.turn = true
    puts "#{@player2.name}: #{prompt.prompt}"
    print "> "
    answer = gets.chomp()
    if answer.to_i == prompt.answer
      puts "\n{@player2.name}: You got it!"
      puts "#{@player2.name}: #{@player1.lives}/3 vs Player 2: #{@player2.lives}/3"
    else
      @player2.lives -= 1
      puts "\n#{@player2.name}: Seriously? No!"
      puts "#{@player2.name}: #{@player1.lives}/3 vs Player 2: #{@player2.lives}/3"
    end
    play()
  else
    if !@player1.check_lives && @player2.check_lives
       puts "\n#{@player2.name} wins with a score of #{@player2.lives}/3"
       puts '---- GAME OVER ----'
       puts 'Good bye!'
    elsif !@player2.check_lives && @player1.check_lives
       puts "\n#{@player1.name} wins with a score of #{@player1.lives}/3"
       puts '---- GAME OVER ----'
       puts 'Good bye!' 
    elsif !@player2.check_lives && !@player1.check_lives
      puts "\nYou Tied!"
       puts '---- GAME OVER ----'
       puts 'Good bye!'
     end 
  end
end

  play()
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
 