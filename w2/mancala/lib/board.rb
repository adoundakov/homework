  require 'byebug'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 , @name2 = name1, name2
    @cups = Array.new(14) {[]}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    (0..12).each do |idx|
      next if idx == 6
      4.times {@cups[idx] << :stone}
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(1,12)
    return false if @cups[start_pos].empty?
    true
  end

  def make_move(start_pos, cur_pl_name)
    goal, opp_goal = cur_pl_name == @name1 ? [6, 13] : [13, 6]
    start_pos -= 1 if start_pos.between?(1,6)
    new_pos = start_pos
    @cups[start_pos].length.times do
      new_pos = (new_pos + 1) % 14
      new_pos = (new_pos + 1) % 14 if new_pos == opp_goal
      @cups[new_pos] << @cups[start_pos].pop
    end

    next_turn(new_pos, goal)
  end

  def next_turn(ending_cup_idx, goal)
    # helper method to determine what #make_move returns
    if ending_cup_idx == goal
      return :prompt
    elsif @cups[ending_cup_idx].count == 1
      return :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def cups_empty?
    bott_cups = @cups.take(6)
    top_cups = @cups[7..12]

    if bott_cups.all? { |e| e.empty? } || top_cups.all? { |e| e.empty? }
      return true
    else
      return false
    end
  end

  def winner
    case @cups[6] <=> @cups[13]
    when -1
      return @name2
    when 0
      return :draw
    when 1
      return @name1
    end
  end
end
