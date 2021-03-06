# --- Part Two ---
#
# Uh oh - the Accounting-Elves have realized that they double-counted everything
# red.
#
# Ignore any object (and all of its children) which has any property with the
# value "red". Do this only for objects ({...}), not arrays ([...]).

json = File.read("./input/json.txt")

class Account
  def initialize(json)
    self.account = json
    parse_objects
  end

  def parse_objects
    self.account.match("{")
    start = Regexp.last_match(0)[0] # Index of curly brace
    account = self.account[start..-1]

    depth = 1
    until depth.zero?
      bracket = account.match(/{|}/).to_s
      bracket == "}" ? depth -= 1 : depth += 1
      account = account if depth > 0
    end
  end
end
