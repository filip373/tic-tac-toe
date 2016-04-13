require './tiles'

class Game

  def initialize(players)
    @players = players
    @next = 0
    @tiles = Tiles.new
  end

  def start
    loop do 
      make_move
      @tiles.display
      break if @tiles.finished?
    end
    puts result
  end

  private

  def make_move
    player = next_player
    print "#{player.introduce}'s turn: "
    input = gets.chomp
    @tiles.add(input, player)
  end

  def next_player
    player = @players[@next]
    @next = (@next + 1) % @players.size
    return player
  end

  def result
    return @tiles.winner.introduce + ' won!' if @tiles.won?
    return 'Draw!' if @tiles.finished?
    raise 'Game not finished!'
  end
end