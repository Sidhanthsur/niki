require 'chronic'
require 'nickel'

s1=" last two years"

puts Chronic.parse(s1)
text_to_process="before 5 pm"
n = Nickel.parse "today before 5pm"
puts 'listen '
puts Chronic.parse("before 5pm the next day")

puts n.occurrences[0].start_time
puts n.occurrences[0].start_time.to_time
if /before [0-9]/.match(text_to_process)
puts 'Hola sid success'
end
if Chronic.parse(text_to_process) != nil && (/before [0-9]/.match(text_to_process) || /after [0-9]/.match(text_to_process))
  puts 'Hola watha'
end
