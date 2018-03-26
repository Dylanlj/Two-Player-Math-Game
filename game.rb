

class Game
  attr_accessor :player1, :player2
  def initialize(player1, player2)
    @player1 = Players.new(player1)
    @player2 = Players.new(player2)

    @question = 0
    @players = [@player1, @player2]
    @turn = Turn_manager.new(@players)
  end

  def game_over?
    return @turn.current_player.lives == 0
  end

  def summary

    puts "-----#{@player1.name} score: #{@player1.score} lives: #{@player1.lives} vs #{@player2.name} score: #{@player2.score} lives: #{@player2.lives}-----"
  end



  def run

    puts "Welcome to the Math Game"

    while !game_over?

      summary
      @turn.next_turn
      puts "It is #{@turn.current_player.name}s turn"
      first_num = new_question
      second_num = new_question
      puts "solve the equation: #{first_num} + #{second_num}"
      answer = $stdin.gets.chomp.to_i
      if answer == (first_num + second_num)
        puts "You solved the equation!"
        @turn.current_player.score += 1
      else
        puts"You failed to solve the equation"
        @turn.current_player.lives -= 1

      end


    end
    @turn.next_turn
    puts "-----------------------------"
    puts "#{@turn.current_player.name} won with a score of #{@turn.current_player.score} and #{@turn.current_player.score} lives remaining"
    puts "Game over"
  end

  def new_question
    return Random.rand(20)
  end
end

