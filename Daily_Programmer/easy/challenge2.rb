def prompt(question = "")
  puts question
  print ">"
  $stdin.gets.chomp.downcase
end

def menu
  puts "What do you want to calculate?"
  puts "F> Force"
  puts "A> Acceleration"
  puts "M> Mass"
  calculate
end

def calculate
  case prompt
  when "f" then prompt_force
  when "a" then prompt_acceleration
  when "m" then prompt_mass
  else menu
  end
end

def prompt_force
  mass = prompt("What's the mass?").to_f
  acceleration = prompt("What's the acceleration?").to_f
  puts "The force is #{mass * acceleration}"
end

def prompt_acceleration
  mass = prompt("What's the mass?").to_f
  force = prompt("whatos the force?").to_f
  puts "The acceleration is #{force / mass}"
end

def prompt_mass
  acceleration = prompt("What's the acceleration?").to_f
  force = prompt("Wnat's the force?").to_f
  puts "The mass is #{force / acceleration}"
end

menu
