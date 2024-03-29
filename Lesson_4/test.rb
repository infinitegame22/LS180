class Fighter
  attr_accessor :health

  def initialize
    @health = 100
  end

  def punch
  end

  def kick
  end

  def block
  end

  def to_s
    puts "*********"
    puts "FIGHT! FIGHT! #{self.name}"
    puts "*********"
  end
end

module Fireable
  def set_fire
    puts "set stuff on fire"
  end
end

module Flyable
  def fly
    puts "fly, fly away"
  end
end

class Raiden < Fighter
  attr_reader :name

  include Fireable

  def initialize
    super
    @name = "Raiden"
    @appearance = "very large hat"
    @entity = "God"
  end
  
  def special_move(other)
    shoot_lightning(other)
  end

  def shoot_lightning(other)
    other.health -= 15
  end

  def special_ability
    set_fire
  end
end

class Kitana < Fighter
  attr_reader :name
  
  include Flyable

  def initialize
    super
    @name = "Kitana"
    @appearance = "fans"
    @entity = "Human"
  end
  
  def special_move(other)
    throw_fans(other)
  end

  def thow_fans(other)
    other.health -= 25
  end

  def special_ability
    fly
  end
end

class LiuKane < Fighter
  attr_reader :name
  
  include Flyable

  def initialize
    super
    @name = "Liu Kane"
    @appearance = "shirtless"
    @entity = "Human"
  end

  def special_move(other)
    transform_dragon(other)
  end

  def transform_dragon(other)
    other.health -= 72
  end

  def special_ability
    fly
  end
end

class Jax < Fighter
  attr_reader :name
  
  include Fireable

  def initialize
    super
    @name = "Jax"
    @appearance = "metal arms"
    @entity = "Human"
  end

  def special_move(other)
    pound_ground(other)
  end

  def pound_ground(other)
    other.health -= 63
  end
end

class Game
  attr_reader :fighter1, :fighter2

  FIGHTERS = ["Raiden", "Kitana", "Liu Kane", "Jax"]
  ARENAS = ["Cage Mansion", "The Gateway", "Treasure Chamber"]

  def initialize
    @fighter1 = select_player
    @fighter2 = select_player
    @arena = select_arena
  end

  def welcome
    system "clear"
    puts "welcome animation"
  end

  def select_player
    puts "Select your fighter: #{FIGHTERS.join(', ')}"
    fighter_selection = ""
    loop do
      fighter_selection = gets.chomp
      break if FIGHTERS.include?(fighter_selection)
      puts "invalid fighter selection"
    end
    fighter_name = Object.const_get(fighter_selection)
    fighter_name.new
  end
  
  def fight
    #fight
  end 

  def select_arena
    puts "Select your arena: #{ARENAS.join(', ')}"
    arena_selection = ""
    loop do
      arena_selection = gets.chomp
      break if arena_selection.include?(arena_selection)
      puts "Invalid arena selection. Please try again"
    end
    arena_selection
  end

  def game_over
    system "clear"
    puts "game over animation"
  end

  def play
    fight
    game_over if fighter1.health <= 0 || fighter2.health <= 0
  end
end

# mortal_kombat = Game.new()
# mortal_kombat.play
jax = Jax.new
raiden = Raiden.new
kitana = Kitana.new
p raiden.special_move(jax)
p kitana.special_move(raiden)