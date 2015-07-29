require 'chronic'
require 'nickel'

s1=" last two years"

puts Chronic.parse(s1)

n = Nickel.parse "today before 5pm"
puts n.occurrences[0].start_time
puts n.occurrences[0].start_time.to_time
