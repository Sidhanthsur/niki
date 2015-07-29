require 'chronic'
require 'chronic_between'
require 'nickel'




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
#  puts text_to_process[i]
  fs=fs + text_to_process[i]
  i=i+1
end
   return fs
end

puts 'Enter the text you want to process'

text_to_process = gets
s = 'Mon-Fri, Saturday, Sunday'
c = ChronicBetween.new(s)
#text_to_poces="before 5pm is good"
 text_to_process.downcase!
if Chronic.parse(text_to_process) == nil
if text_to_process.include?'for'
  puts 'its a period'
  inp=text_to_process.index 'for'
  s3= cut_short(text_to_process)
  s4="before"+s3
  puts 'from'
  puts Chronic.parse(s4)
  puts 'to'
  puts Time.now
end
elsif Chronic.parse(text_to_process) == nil
#if c.within?DateTime.parse(text_to_process)
 puts 'it is a tTrigger'
 text_to_process.downcase!
 puts text_to_process
  if text_to_process.include?'before'
      puts 'start:'
      puts Time.now
      puts 'end:'
      s2="today before"+text_to_process
      n = Nickel.parse s2
      puts n.occurrences[0].start_time.to_time
else
  puts 'start:'
  s2="today after"+text_to_process
  n = Nickel.parse s2
  puts n.occurrences[0].start_time.to_time

end

else

#  puts 'the te is ' + text_to_process

  puts Chronic.parse(text_to_process)

end
