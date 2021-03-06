#spooky loops by Robin Newman for Sonic-Pi October 12th 2013
#This short program explores the use of nested loops and random numbers to generate a never ending rising and falling sound using the fm synth

with_tempo 300 #set the tempo (chosen so that no clicking but not too slow)
with_synth "fm" #set the synth (gives a nice spooky noise)
repeat do #the sequence repeats until you press the stop button
  p = 1 #you can use variables in Sonic-Pi This one is set to adjust whether the notes are rising 1 or falling 2
  n = 32 #this variable sets the starting octave (c = 32)
  2.times do # the sequence is run twice. The first time the notes rise, the second they fall
    if p == 1 #this tests if first time p is 1 or second time p is 2. Note the == for comparison
      inc = 12 #this variable is the octave increment (midi number up by twelve each octave) first time the octave rises
    else
      inc = -12 #second time through the octave falls again each time through the next loop
    end
    6.times do #the sequence goes through six octaves
      5.times do #random note patterns are played 5 times, each note is pitched in the current octave at random
        play_pattern [ (n + rand * 12),(n + rand * 12),(n + rand * 12),(n + rand * 12)]
      end
      n = n + inc #set the base value for the next octave
    end
    n = n - inc #last time through the previous loop we don't want to increase the octave so correct it
    p = 2 #set p for the next pass to make the octaves decrease
  end #now repeat for the second pass with the octaves decreasing
end #repeat the whole sequence indefinitely until stop is pressed
