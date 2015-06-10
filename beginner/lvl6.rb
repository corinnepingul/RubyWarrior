
class Player
  def initialize
    @last_health = 20
    @checked_back = false
  end

  def rescue_or_attack(warrior)
    if warrior.feel.captive?
      warrior.rescue!
    else
      warrior.attack!
    end
  end

  def play_turn(warrior)
    if warrior.feel(:backward).wall? == true
      @checked_back = true
    end

    if warrior.feel(:backward).wall? == false && warrior.feel(:backward).empty? && @checked_back == false
      warrior.walk!(:backward)
    elsif warrior.feel(:backward).wall? == false && warrior.feel(:backward).captive?
      warrior.rescue!(:backward)
    elsif warrior.feel.empty? && warrior.health < 20 && warrior.health >= @last_health
      warrior.rest!
    # if the warrior is being attacked from afar
    elsif warrior.feel.empty? && warrior.health < 9 && warrior.health < @last_health
      warrior.walk!(:backward)

    # if there's something in the way
    elsif warrior.feel.empty? == false
      rescue_or_attack(warrior)

    # if the warrior's path is empty and it doesn't need more health
    else warrior.feel.empty?
      warrior.walk!
    end

    @last_health = warrior.health
  end
end
