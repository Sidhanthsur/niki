require 'chronic'
require 'chronic_between'
require 'nickel'



# there are times when people use past as last. The libraries dont understand last and so this make
#the last to past


def cut_short(text_to_process)
 inp=text_to_process.index 'for'
fs=""
if  text_to_process.include?'last'

 text_to_process.sub('last','past')
 inp=inp+5
 end
len=text_to_process.length
i=inp+3
while i < len

  fs=fs + text_to_process[i]
  i=i+1
end
   return fs
end

choice = 1;
while choice == 1 do

puts 'Enter the text you want to process'

text_to_process = gets

s = 'Mon-Fri, Saturday, Sunday'#range of timings . can me made like Mon-Fri 19:00,sat 10:00

c = ChronicBetween.new(s)

 text_to_process.downcase!



if Chronic.parse(text_to_process) == nil #this means that chronic can't understand things like before 5pm
if text_to_process.include?'for'#for period for/from is a must



  inp=text_to_process.index 'for'
  s3= cut_short(text_to_process)
  s4="before"+s3 #to make it parseable to chronic

  File.open('output.txt', 'a') { |file| file.write("\ntPeriod\t\t") }
  File.open('output.txt', 'a') { |file| file.write(Chronic.parse(s4)) }
    File.open('output.txt', 'a') { |file| file.write(" ") }
  File.open('output.txt', 'a') { |file| file.write(Time.now) }


end
elsif Chronic.parse(text_to_process) != nil && (/before \d+/.match(text_to_process) || /after \d+/.match(text_to_process))

 puts 'it is a tTrigger'
 text_to_process.downcase!
 puts text_to_process
  if text_to_process.include?'before' #need to denote start and time

      s2="today before"+text_to_process
      s5=text_to_process
      n = Nickel.parse s2
      if Time.now > n.occurrences[0].start_time.to_time #if deadline already passed
        File.open('output.txt', 'a') { |file| file.write("\ntTrigger\t") }
        File.open('output.txt', 'a') { |file| file.write("invalid trigger") }

      else


      File.open('output.txt', 'a') { |file| file.write("\ntTrigger\t") }
      File.open('output.txt', 'a') { |file| file.write(Time.now) }
        File.open('output.txt', 'a') { |file| file.write(" ") }
      File.open('output.txt', 'a') { |file| file.write(n.occurrences[0].start_time.to_time) }
end
else #this one if for after triggers needing only start time

  s2="today after"+text_to_process
  n = Nickel.parse s2
  #puts n.occurrences[0].start_time.to_time
  File.open('output.txt', 'a') { |file| file.write("\ntTrigger\t") }
  File.open('output.txt', 'a') { |file| file.write(n.occurrences[0].start_time.to_time) }

end

else
#This is for any parseable recognized by chronic

File.open('output.txt', 'a') { |file| file.write("\ntStamp\t\t") }

    File.open('output.txt', 'a') { |file| file.write(Chronic.parse(text_to_process)) }

end
puts 'press 1 to continue 0 to exit'
choice =  gets.chomp.to_i
end
