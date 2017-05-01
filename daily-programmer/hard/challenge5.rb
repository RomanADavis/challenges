# Arrr, me mateys! Yer' challenge fer' today be a tough one. It be gettin awfully
# borein' on the high seas, so yer' job be to create a pirate based fightin'
# game! This game oughter' be turn based, and you oughter' be able to pick yer
# attacks every turn. The best game'll be winnin' some custom flair, and all the
# rest o' ya will be walkin the plank!

class Game
  def initialize
    @chance = Random.new
    @player = Player.new(@chance)
    @enemy = Enemy.new(@chance)
  end

  def intro
    puts "Alas, poor lad. Yeh've b'n captured by Billy Bob's crew of murderous"
    puts "buckaneers. They'v jus' b'n waitin' fur a good excuse to slit yer "
    puts "sorry throat. But ye've got one chance to prove yerself in a battle"
    puts "agaist a member 'v Billy Bob's crew."
  end

  def run
    intro
    loop do
      @player.attack(@enemy)
      win if @enemy.health <= 0
      @enemy.attack(@player)
      lose if @player.health <= 0
    end
  end

  def win
    puts "Yeh've narrowly escaped the clutches of death as the man falls over"
    puts "board. Yeh clutch your chest and catch yer breath as the crowd cheers"
    puts "and welcomes yeh aboard the crew."
    exit(0)
  end

  def lose
    puts "Yer dizzy and blood soaks yer clothes. Yeh clutch out for something t'"
    puts "support yerself. The world spins around as you fall into the sea and"
    puts "the water turns red with yer blood."
    exit(0)
  end
end

class Player
  attr_accessor :health

  def initialize(chance)
    @chance = chance
    puts "What's yer name, ya' worthless landlubber?"
    @name = $stdin.gets.chomp
    @health = 100
  end

  def description
    puts "Ya' sorry sea dog! Yeh've  only got a plank a' wood to defend yerself"
    puts "with and a canteen 'v rum. Yer health is #{@health}."
    puts "What're ya' gonna do, mate?"
  end

  def battle_prompt(enemy)
    puts "[A]> Smash the sorry sea dog with the plank!"
    puts "[B]> Drink a sip 'v rum."
    puts "[C]> Laydown and die like the sorry landlubber yeh are!"

    case $stdin.gets.chomp.upcase
    when "A" then charge(enemy)
    when "B" then drink
    else choke
    end
  end

  def charge(enemy)
    hit = (@chance.rand > 0.1)
    damage = @chance.rand(1..7) * 7
    puts "You yell and charge at the scury dog, aiming square at his head."
    if hit
      enemy.take_hit(damage)
    else
      enemy.dodge
    end
  end

  def drink
    health = rand(14..28)
    puts "You take a swig 'v rum at fast as y' can. Clenching yer plank in the"
    puts "face 'v death itself. You heal #{health} health."
    @health += health
  end

  def attack(enemy)
    description
    battle_prompt(enemy)
  end

  def take_hit(damage)
    puts "You look down to see blood dripping down on yer shirt. You take #{damage}"
    puts "damage."
    @health -= damage
  end

  def dodge
    puts "Yeh see the glint 'v his hook pass your face as yeh spin out 'v the "
    puts "way and ready yer next attack."
  end
end

class Enemy
  attr_reader :health

  def initialize(chance)
    @health = 100
    @chance = chance
  end

  def take_hit(damage)
    puts "He roars out a pirate curse as he takes #{damage}."
    @health -= damage
  end

  def attack(player)
    case @chance.rand(1..3)
    when 1 then trip
    when 2 then hook(player)
    else boot(player)
    end
  end

  def hook(player)
    hit = (@chance.rand > 0.2)
    damage = @chance.rand(9..15)
    puts "The buckaneer lunges out with his rusty hook."
    if hit
      puts "The digs the hook into your flesh."
      player.take_hit(damage)
    else
      player.dodge
    end
  end

  def boot(player)
    hit = (@chance.rand > 0.4)
    damage = @chance.rand(21..43)
    puts "The buckaneer forces yeh t' the ground and stamps down with his foot."
    if hit
      puts "Yeh let out a roar of pain as he crushes yeh beneath his boot."
      player.take_hit(damage)
    else
      puts "Yeh roll out of the way just in time."
    end
  end

  def trip
    damage = @chance.rand(5..12)
    puts "The scurvy sea dog ducks his head and rushes you. He trip and falls"
    puts "recieving #{damage} damage."
    @health -= damage
  end

  def take_hit(damage)
    puts "He grunts as he take #{damage} damage."
    @health -= damage
    if @health > 0
      puts "His eyes gleam with hate. He won't let you get a hit that easily next"
      puts "time."
    else
      puts "You can see thoughts whirl through his head as he plans a small retreat"
      puts "but as he steps back, he falls in t' the watery dept's."
    end
  end

  def dodge
    puts "He moves his head t' the side as you miss. He grins and as he readies"
    puts "he his next attack!"
  end
end

Game.new.run
