class Player
  @last_health = 20

  def rescue_or_attack(warrior)
    if warrior.feel.captive?
      warrior.rescue!
    else
      warrior.attack!
    end
  end

  def play_turn(warrior)
    if warrior.feel.empty? && warrior.health < 20 && warrior.health >= @last_health
      warrior.rest!
    elsif warrior.feel.empty? == false
      rescue_or_attack(warrior)
    else warrior.feel.empty?
      warrior.walk!
    end

    @last_health = warrior.health
  end
end
