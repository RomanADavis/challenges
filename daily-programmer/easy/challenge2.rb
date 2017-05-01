#Hello, coders! An important part of programming is being able to apply your
#programs, so your challenge for today is to create a calculator application
#that has use in your life. It might be an interest calculator, or it might be
#something that you can use in the classroom. For example, if you were in
#physics class, you might want to make a F = M * A calc.

#EXTRA CREDIT: make the calculator have multiple functions! Not only should it
#be able to calculate F = M * A, but also A = F/M, and M = F/A!

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
