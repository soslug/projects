#This file illustrates the use of the play_pattern_timed command with the "attack" parameter. Using this the note sounds throughout its duration. Also illustrated are the use of nn.times do...end loops and the use of in_thread to play a concurrent part.
#This version includes an optional second parallen thread for a pedal base note, but it gives a rather scratchy sounding result
#copy after the dider and paste into Sonic-P
#==================================================

#Eleanor Rigby by John Lennon and Paul McCartney coded for Sonic-Pi by Robin Newman 6 Oct 2013
#the piece illustrates the use of the play_pattern_timed command using the attack paremeter. This enables
#you to have the note playing throughout the duration of the note, by setting the attack number equal
#to the note duration eg play_pattern_timed [60],[0.5], attack: 0.5 would sound a C for half a second
#you can also play stacatto bu reducing the attack number less than the duration of the note as in the fourth bar
#Threads are used so that the left hand part sounds simultaneously with the right hand. The pice also has a base
#drome note which is included in a second in_thread sequence. The Pi finds it hard to handle towe simultaneous
#threads and a certain scratchyness results. If you don't like this you can omit the three threads marked #bass note thread
#nb these are NOT the left hand threads which you DO need to keep
#unlike the Bach Minuet I also coded, this time it is not convenient to code in bar lengths, as there are syncopated
#rhythms across bar lines, but some comments are added to indicate where you are in the music
#where possible sections are repeated using n.times do ......end constructs. These are also used to repeat the verses
#and the intro. The third verse is copy and pasted because it differs in the last two bars

#based on the music version published here http://www.paperbagmusic.com/media/Beatles_all_songs.pdf (page 119)

#intro 4 bars before double bar line with repeat
2.times do
 in_thread do #bass note thread (can be removed)
  use_synth :pretty_bell
  play_pattern_timed [48],[4], attack: 4
  play_pattern_timed [40],[4], attack: 4
 end
 in_thread do #left hand thread (needed)
  use_synth :pretty_bell
  play_pattern_timed [60,55],[0.5], attack: 0.5
  play_pattern_timed [60],[3.0], attack: 3.0
  play_pattern_timed [52,55,59],[0.5], attack: 0.5
  sleep 2.5
 end

 use_synth :pretty_bell #play the tune
 play_pattern_timed [76],[1.25], attack: 1.25
 play_pattern_timed [78,79],[0.25], attack: 0.25
 play_pattern_timed [81,79,78,76],[0.5], attack: 0.5
 play_pattern_timed [71],[0.375], attack: 0.375
 play_pattern_timed [69],[0.125], attack: 0.125
 play_pattern_timed [67],[1.25], attack: 1.125
 play_pattern_timed [69,71,67,71,69,71,67,71,64,71],[0.25], attack: 0.1
end #repeat here

#after double bar line
#3 verses, two identical, third one differs in last two bars
2.times do
 in_thread do #play bass note thread (optional can be removed)
  use_synth :pretty_bell
  play_pattern_timed [40],[6], attack: 6
  play_pattern_timed [48],[3], attack: 3
  play_pattern_timed [40],[7], attack: 7
  play_pattern_timed [48],[3], attack: 3
  play_pattern_timed [40],[9], attack: 9
  play_pattern_timed [40],[8], attack: 8
 end

 in_thread do #play left hand (needed)
  use_synth :pretty_bell
  3.times do #bar is repeated three times
   play_pattern_timed [52,55,59,55],[0.5], attack: 0.5
  end

  play_pattern_timed [60,64,54,64,60,64,59,55],[0.5], attack: 0.5
  3.times do #bar is repeated three times
   play_pattern_timed [52,55,59,55],[0.5], attack: 0.5
  end

  play_pattern_timed [60,64,54,64,60,64,59,55,52,55],[0.5], attack: 0.5
  play_pattern_timed [62],[1], attack: 1
  play_pattern_timed [52,55],[0.5], attack: 0.5
  play_pattern_timed [61],[1], attack: 1
  play_pattern_timed [52,55],[0.5], attack: 0.5
  play_pattern_timed [60],[1], attack: 1
  play_pattern_timed [52,55,59,55],[0.5], attack: 0.5
  play_pattern_timed [52,55],[0.5], attack: 0.5
  play_pattern_timed [62],[1], attack: 1
  play_pattern_timed [52,55],[0.5], attack: 0.5
  play_pattern_timed [61],[1], attack: 1
  play_pattern_timed [52,55],[0.5], attack: 0.5
  play_pattern_timed [60],[1], attack: 1
  play_pattern_timed [52,55,59,55],[0.5], attack: 0.5
 end

 use_synth :pretty_bell #play the tune
 play_pattern_timed [67,69,71],[0.25], attack: 0.25 #b4
 play_pattern_timed [67],[0.5], attack: 0.5
 play_pattern_timed [64],[0.75], attack: 0.75
 play_pattern_timed [67,69,71],[0.25], attack: 0.25 #b5
 play_pattern_timed [74],[0.5], attack: 0.5
 play_pattern_timed [73,71],[0.25], attack: 0.25
 play_pattern_timed [73],[0.5], attack: 0.5
 play_pattern_timed [71,69],[0.25], attack: 0.25 #b6
 play_pattern_timed [71],[0.5], attack: 0.5
 play_pattern_timed [69,67],[0.25], attack: 0.25
 play_pattern_timed [69],[2.25], attack: 2.25
 play_pattern_timed [67,69,71],[0.25], attack: 0.25
 play_pattern_timed [72],[0.75], attack: 0.75
 play_pattern_timed [71],[0.5], attack: 0.5
 #repeated
 play_pattern_timed [67,69,71],[0.25], attack: 0.25 #b4
 play_pattern_timed [67],[0.5], attack: 0.5
 play_pattern_timed [64],[0.75], attack: 0.75
 play_pattern_timed [67,69,71],[0.25], attack: 0.25 #b5
 play_pattern_timed [74],[0.5], attack: 0.5
 play_pattern_timed [73,71],[0.25], attack: 0.25
 play_pattern_timed [73],[0.5], attack: 0.5
 play_pattern_timed [71,69],[0.25], attack: 0.25 #b6
 play_pattern_timed [71],[0.5], attack: 0.5
 play_pattern_timed [69,67],[0.25], attack: 0.25
 play_pattern_timed [69],[2.25], attack: 2.25
 play_pattern_timed [67,69,71],[0.25], attack: 0.25
 play_pattern_timed [72],[0.75], attack: 0.75
 play_pattern_timed [71],[0.5], attack: 0.5
 #b 15
 play_pattern_timed [69],[0.5], attack: 0.5
 play_pattern_timed [67],[0.25], attack: 0.25
 play_pattern_timed [69],[0.75], attack: 0.75
 play_pattern_timed [71],[0.25], attack: 0.25
 play_pattern_timed [67],[0.5], attack: 0.5
 play_pattern_timed [64],[1.25], attack: 1.25
 play_pattern_timed [64],[0.25], attack: 0.25
 play_pattern_timed [76],[0.75], attack: 0.75
 play_pattern_timed [71],[0.25], attack: 0.25
 play_pattern_timed [69],[0.5], attack: 0.5
 play_pattern_timed [67,67],[0.25], attack: 0.25
 play_pattern_timed [64],[2.25], attack: 2.25
#repeated
 play_pattern_timed [69],[0.5], attack: 0.5
 play_pattern_timed [67],[0.25], attack: 0.25
 play_pattern_timed [69],[0.75], attack: 0.75
 play_pattern_timed [71],[0.25], attack: 0.25
 play_pattern_timed [67],[0.5], attack: 0.5
 play_pattern_timed [64],[1.25], attack: 1.25
 play_pattern_timed [64],[0.25], attack: 0.25
 play_pattern_timed [79],[0.75], attack: 0.75
 play_pattern_timed [76],[0.25], attack: 0.25
 play_pattern_timed [71],[0.5], attack: 0.5
 play_pattern_timed [69,69],[0.25], attack: 0.25
 play_pattern_timed [67],[2.25], attack: 2.25
end

#last verse differs in last bar
in_thread do #play bass note thread (optional can be removed)
 use_synth :pretty_bell
 play_pattern_timed [40],[6], attack: 6
 play_pattern_timed [48],[3], attack: 3
 play_pattern_timed [40],[7], attack: 7
 play_pattern_timed [48],[3], attack: 3
 play_pattern_timed [40],[9], attack: 9
 play_pattern_timed [40],[8], attack: 6 #reduced length last time
end
in_thread do #play left hand (needed)
 use_synth :pretty_bell
 3.times do
  play_pattern_timed [52,55,59,55],[0.5], attack: 0.5
 end

 play_pattern_timed [60,64,54,64,60,64,59,55],[0.5], attack: 0.5

 3.times do
  play_pattern_timed [52,55,59,55],[0.5], attack: 0.5
 end

 play_pattern_timed [60,64,54,64,60,64,59,55,52,55],[0.5], attack: 0.5
 play_pattern_timed [62],[1], attack: 1
 play_pattern_timed [52,55],[0.5], attack: 0.5
 play_pattern_timed [61],[1], attack: 1
 play_pattern_timed [52,55],[0.5], attack: 0.5
 play_pattern_timed [60],[1], attack: 1
 play_pattern_timed [52,55,59,55],[0.5], attack: 0.5
 play_pattern_timed [52,55],[0.5], attack: 0.5
 play_pattern_timed [62],[1], attack: 1
 play_pattern_timed [52,55],[0.5], attack: 0.5
 play_pattern_timed [61],[1], attack: 1
 play_pattern_timed [52,55],[0.5], attack: 0.5
 play_pattern_timed [60],[1], attack: 1
#3rd time bar follows
 play_chord [52,55,59,40], attack: 4 #two bars length
end

use_synth :pretty_bell #play tune
play_pattern_timed [67,69,71],[0.25], attack: 0.25 #b4
play_pattern_timed [67],[0.5], attack: 0.5
play_pattern_timed [64],[0.75], attack: 0.75
play_pattern_timed [67,69,71],[0.25], attack: 0.25 #b5
play_pattern_timed [74],[0.5], attack: 0.5
play_pattern_timed [73,71],[0.25], attack: 0.25
play_pattern_timed [73],[0.5], attack: 0.5
play_pattern_timed [71,69],[0.25], attack: 0.25 #b6
play_pattern_timed [71],[0.5], attack: 0.5
play_pattern_timed [69,67],[0.25], attack: 0.25
play_pattern_timed [69],[2.25], attack: 2.25
play_pattern_timed [67,69,71],[0.25], attack: 0.25
play_pattern_timed [72],[0.75], attack: 0.75
play_pattern_timed [71],[0.5], attack: 0.5
#repeated
play_pattern_timed [67,69,71],[0.25], attack: 0.25 #b4
play_pattern_timed [67],[0.5], attack: 0.5
play_pattern_timed [64],[0.75], attack: 0.75
play_pattern_timed [67,69,71],[0.25], attack: 0.25 #b5
play_pattern_timed [74],[0.5], attack: 0.5
play_pattern_timed [73,71],[0.25], attack: 0.25
play_pattern_timed [73],[0.5], attack: 0.5
play_pattern_timed [71,69],[0.25], attack: 0.25 #b6
play_pattern_timed [71],[0.5], attack: 0.5
play_pattern_timed [69,67],[0.25], attack: 0.25
play_pattern_timed [69],[2.25], attack: 2.25
play_pattern_timed [67,69,71],[0.25], attack: 0.25
play_pattern_timed [72],[0.75], attack: 0.75
play_pattern_timed [71],[0.5], attack: 0.5
#b 15
play_pattern_timed [69],[0.5], attack: 0.5
play_pattern_timed [67],[0.25], attack: 0.25
play_pattern_timed [69],[0.75], attack: 0.75
play_pattern_timed [71],[0.25], attack: 0.25
play_pattern_timed [67],[0.5], attack: 0.5
play_pattern_timed [64],[1.25], attack: 1.25
play_pattern_timed [64],[0.25], attack: 0.25
play_pattern_timed [76],[0.75], attack: 0.75
play_pattern_timed [71],[0.25], attack: 0.25
play_pattern_timed [69],[0.5], attack: 0.5
play_pattern_timed [67,67],[0.25], attack: 0.25
play_pattern_timed [64],[2.25], attack: 2.25
#repeated
play_pattern_timed [69],[0.5], attack: 0.5
play_pattern_timed [67],[0.25], attack: 0.25
play_pattern_timed [69],[0.75], attack: 0.75
play_pattern_timed [71],[0.25], attack: 0.25
play_pattern_timed [67],[0.5], attack: 0.5
play_pattern_timed [64],[1.25], attack: 1.25
play_pattern_timed [64],[0.25], attack: 0.25
play_pattern_timed [79],[0.75], attack: 0.75
play_pattern_timed [76],[0.25], attack: 0.25
play_pattern_timed [71],[0.5], attack: 0.5
play_pattern_timed [69,69],[0.25], attack: 0.25
#3rd time bar follows
play_pattern_timed [67],[0.75], attack: 0.75
play_pattern_timed [76,71,69],[0.5], attack: 0.5
play_pattern_timed [67],[2], attack: 2

#end of piece


