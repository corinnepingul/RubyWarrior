class Player
  def play_turn(warrior)
    if warrior.feel.empty? && warrior.health < 20
      warrior.rest!
    elsif warrior.feel.empty? == false
      warrior.attack!
    else warrior.feel.empty?
      warrior.walk!
    end
  end
end
