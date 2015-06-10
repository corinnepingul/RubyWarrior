class Player
  @last_health = 20

  def play_turn(warrior)
    if warrior.feel.empty? && warrior.health < 20 && warrior.health >= @last_health
      warrior.rest!
    elsif warrior.feel.empty? == false
      warrior.attack!
    else warrior.feel.empty?
      warrior.walk!
    end

    @last_health = warrior.health
  end
end
