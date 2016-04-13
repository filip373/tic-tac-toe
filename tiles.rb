class Tiles

  def initialize
    @tiles = {}
  end

  def add(index, player)
    raise "Invalid tile index: #{index}." unless validate?(index)
    raise "Tile #{index} already taken." unless free?(index)
    @tiles[index] = player
    @last_move = player
  end

  def display
    %w{a b c}.each do |l|
      puts '-------'
      [1, 2, 3].each do |n|
        index = l + n.to_s
        print '|' + (@tiles.key?(index) ? @tiles[index].mark : ' ')
      end
      puts '|'
    end
    puts '-------'
  end

  def won?
    !find_winner.nil?
  end

  def finished?
    won? || @tiles.size > 8
  end

  def winner
    raise 'There are no winners.' unless won?
    find_winner
  end

  private

  def free?(index)
    !@tiles.key?(index)
  end

  def validate?(index)
    index =~ /[a-c][1-3]/
  end

  def find_winner
    # vertical
    %w{a b c}.each do |l|
      return @last_move if @tiles[l + '1'] == @last_move && @tiles[l + '2'] == @last_move && @tiles[l + '3'] == @last_move
    end
    # horizontal
    %w{1 2 3}.each do |n|
      return @last_move if @tiles['a' + n] == @last_move && @tiles['b' + n] == @last_move && @tiles['c' + n] == @last_move
    end
    #diagonal
    return @last_move if @tiles['a1'] == @last_move && @tiles['b2'] == @last_move && @tiles['c3'] == @last_move
    return @last_move if @tiles['a3'] == @last_move && @tiles['b2'] == @last_move && @tiles['c1'] == @last_move
    return nil
  end
end
