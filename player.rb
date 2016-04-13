class Player
  attr_reader :mark

  def initialize(name, mark)
    @mark = mark
    @name = name
  end

  def introduce
    @name
  end
end
