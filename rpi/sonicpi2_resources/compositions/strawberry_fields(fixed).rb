#Welcome to Sonic Pi v2.0

#Strawberry Fields Forever (Beatles) coded for sonic-pi by Robin Newman 7th Oct 2013

#music source from http://paperbagmusic.com/media/Beatles_all_songs.pdf page 160
#uses in_thread for left hand played simultaneously with the RH tune
#the thread is split so that it can be resynchronised with the tune in the middle of each section
#to play chords that link, use an attack a bit less than the required duration, and start the chord
#then sleep for the required duration of the chord. A bit of a bodge but seems to work reasonably well
# eg play_chord [n1,n2,n3], attack: 0.8 followed by sleep 1 gives choard effective duration 1
# nn.times do...end used for repeats

#verse section repeated twice. Verse three has different timings to fit the words
2.times do
#left hand thread first 9 bars
 in_thread do
  use_synth :saw_beep
  play_chord [43,55,59,62], attack:  1.5
  sleep 2
  play_chord [43,50,43,59], attack:  1.5
  sleep 2
  play_pattern_timed [43],[0.5], attack: 0.5
  play_chord [43,50,57,60], attack:  0.2
  sleep 0.5
  play_chord [43,50,57,60], attack:  0.8
  sleep 1.5
  play_pattern_timed [50,53,57],[0.5], attack:  0.5
  play_chord [40,50,56,59], attack:  1.8
  sleep 2
  play_pattern_timed [40,47,53,56],[0.5], attack: 0.5
  play_chord [36,52,55], attack: 0.8
  sleep 1
  play_chord [40,52,59], attack: 0.8
  sleep 1
  play_pattern_timed [56,57],[0.25], attack: 0.25
  play_pattern_timed [59],[0.5], attack: 0.5
  play_chord [36,48,55], attack: 0.8
  sleep 1
  play_chord [43,55,59], attack: 1.3
  sleep 1.5
 end
#main tune follows first 9 bars
 use_synth :saw_beep
 play_pattern_timed [0,0,71,71],[0.25], attack: 0.25
 play_pattern_timed [72,71,67],[0.5], attack: 0.5
 play_pattern_timed [62,64,69],[0.25], attack: 0.25
 play_pattern_timed [67],[0.75], attack: 0.75
 play_pattern_timed [65],[1], attack: 1
 play_pattern_timed [65,67,69],[0.333], attack: 0.333
 play_pattern_timed [62,0,0],[1], attack: 1
 play_pattern_timed [65,67,68],[0.333], attack: 0.333
 play_pattern_timed [62],[1], attack: 1
 play_pattern_timed [0,0],[0.5,0.25]
 play_pattern_timed [62,74,72,71,69,68,69],[0.25], attack: 0.25
 play_pattern_timed [71],[0.5], attack: 0.5
 play_pattern_timed [0],[1]
 play_pattern_timed [71,67,64,71,67,64],[0.167], attack: 0.167
 play_pattern_timed [69],[0.25], attack: 0.25
 play_pattern_timed [67],[1.25], attack: 1.25
 play_pattern_timed [0],[0.5]
 #bar 10 onwards left hand thread (thread synced here)
 in_thread do
  use_synth :saw_beep
  play_chord [38,54,57,62], attack: 0.8
  sleep 1
  play_chord [38,54,57,61], attack: 0.8
  sleep 1
  play_chord [45,50,54,60], attack: 0.8
  sleep 1
  play_chord [48,52,55], attack: 0.4
  sleep 0.5
  play_chord [48,51,54], attack: 0.4
  sleep 0.5
  play_chord [40,52,55,59], attack: 0.8
  sleep 1
  play_chord [38,50,52,55,59], attack: 0.8
  sleep 1
  play_pattern_timed [52,55,52,50],[0.5], attack: 0.5
  play_chord [36,48,52], attack: 0.8
  sleep 1
  play_chord [38,50,60], attack: 0.8
  sleep 1
  play_chord [43,55,59], attack: 0.8
  sleep 1
  play_chord [40,52,55,59], attack: 0.4
  sleep 0.5
  play_chord [38.50], attack: 0.4
  sleep 0.5
  play_chord [36,48,52], attack: 0.8
  sleep 1
  play_chord [38,50,57], attack: 0.8
  sleep 1
  play_chord [36,52,60], attack: 0.4
  sleep 0.5
  play_chord [36,55], attack: 0.4
  sleep 0.5
  play_chord [43,50,59], attack: 0.8
  sleep 1
 end
#rh tune from bar 11
 play_pattern_timed [69,69,69,69,69,69],[0.333], attack: 0.333
 play_pattern_timed [69],[0.5], attack: 0.5
 play_pattern_timed [69],[1.5], attack: 1.5
 play_pattern_timed [0,67,67,67,71,69,67,66,69],[0.25], attack: 0.25
 play_pattern_timed [67],[0.75], attack: 0.75
 play_pattern_timed [0,0],[1,0.25]
 play_pattern_timed [67,67,67,66,64,62,71,67],[0.25], attack: 0.25
 play_pattern_timed [67,67,67,69,67,66],[0.125], attack: 0.125
 play_pattern_timed [64],[0.5], attack: 0.5
 play_pattern_timed [0,0],[0.5,0.25]
 play_pattern_timed [67,67,67,69,67,66,64],[0.25], attack: 0.25
 play_pattern_timed [67],[2], attack: 2
end #reepat for verse 2 goes back here
#verse 3 slightly different timings in bars 10-12 to fit words so written out again
#left hand thread first 9 bars
in_thread do
 use_synth :saw_beep
 play_chord [43,55,59,62], attack: 1.5
 sleep 2
 play_chord [43,50,43,59], attack: 1.5
 sleep 2
 play_pattern_timed [43],[0.5], attack: 0.5
 play_chord [43,50,57,60], attack: 0.2
 sleep 0.5
 play_chord [43,50,57,60], attack: 0.8
 sleep 1.5
 play_pattern_timed [50,53,57],[0.5], attack: 0.5
 play_chord [40,50,56,59], attack: 1.8
 sleep 2
 play_pattern_timed [40,47,53,56],[0.5], attack: 0.5
 play_chord [36,52,55], attack: 0.8
 sleep 1
 play_chord [40,52,59], attack: 0.8
 sleep 1
 play_pattern_timed [56,57],[0.25], attack: 0.25
 play_pattern_timed [59],[0.5], attack: 0.5
 play_chord [36,48,55], attack: 0.8
 sleep 1
 play_chord [43,55,59], attack: 1.3
 sleep 1.5
end
#main tune follows first 9 bars
use_synth :saw_beep
play_pattern_timed [0,0,71,71],[0.25], attack: 0.25
play_pattern_timed [72,71,67],[0.5], attack: 0.5
play_pattern_timed [62,64,69],[0.25], attack: 0.25
play_pattern_timed [67],[0.75], attack: 0.75
play_pattern_timed [65],[1], attack: 1
play_pattern_timed [65,67,69],[0.333], attack: 0.333
play_pattern_timed [62,0,0],[1], attack: 1
play_pattern_timed [65,67,68],[0.333], attack: 0.333
play_pattern_timed [62],[1], attack: 1
play_pattern_timed [0,0],[0.5,0.25]
play_pattern_timed [62,74,72,71,69,68,69],[0.25], attack: 0.25
play_pattern_timed [71],[0.5], attack: 0.5
play_pattern_timed [0],[1]
play_pattern_timed [71,67,64,71,67,64],[0.167], attack: 0.167
play_pattern_timed [69],[0.25], attack: 0.25
play_pattern_timed [67],[1.25], attack: 1.25
play_pattern_timed [0],[0.5]
#bar 10 onwards left hand thread (thread synced here)
in_thread do
 use_synth :saw_beep
 play_chord [38,54,57,62], attack: 0.8
 sleep 1
 play_chord [38,54,57,61], attack: 0.8
 sleep 1
 play_chord [45,50,54,60], attack: 0.8
 sleep 1
 play_chord [48,52,55], attack: 0.4
 sleep 0.5
 play_chord [48,51,54], attack: 0.4
 sleep 0.5
 play_chord [40,52,55,59], attack: 0.8
 sleep 1
 play_chord [38,50,52,55,59], attack: 0.8
 sleep 1
 play_pattern_timed [52,55,52,50],[0.5], attack: 0.5
 play_chord [36,48,52], attack: 0.8
 sleep 1
 play_chord [38,50,60], attack: 0.8
 sleep 1
 play_chord [43,55,59], attack: 0.8
 sleep 1
 play_chord [40,52,55,59], attack: 0.4
 sleep 0.5
 play_chord [38.50], attack: 0.4
 sleep 0.5
 play_chord [36,48,52], attack: 0.8
 sleep 1
 play_chord [38,50,57], attack: 0.8
 sleep 1
 play_chord [36,52,60], attack: 0.4
 sleep 0.5
 play_chord [36,55], attack: 0.4
 sleep 0.5
 play_chord [43,50,59], attack: 0.8
 sleep 1
end
#rh tune bar 10 onwards (timimg changed bars 10-12 to fit words
play_pattern_timed [69,69,69,69],[0.5], attack: 0.5 #bar 10 changed timing
play_pattern_timed [69,69],[0.5], attack: 0.5
play_pattern_timed [69,69],[0.25], attack: 0.25
play_pattern_timed [69],[1], attack: 1
play_pattern_timed [67,67,67,67,71,69,67,66,69],[0.25], attack: 0.25 #bar 12 changed notes
play_pattern_timed [67],[0.75], attack: 0.75
play_pattern_timed [0,0],[1,0.25]
play_pattern_timed [67,67,67,66,64,62,71,67],[0.25], attack: 0.25
play_pattern_timed [67,67,67,69,67,66],[0.125], attack: 0.125
play_pattern_timed [64],[0.5], attack: 0.5
play_pattern_timed [0,0],[0.5,0.25]
play_pattern_timed [67,67,67,69,67,66,64],[0.25], attack: 0.25
play_pattern_timed [67],[2], attack: 2
#coda section
#left hand thread 1st nine bars same as in verse 1
in_thread do
 use_synth :saw_beep
 play_chord [43,55,59,62], attack: 1.5
 sleep 2
 play_chord [43,50,43,59], attack: 1.5
 sleep 2
 play_pattern_timed [43],[0.5], attack: 0.5
 play_chord [43,50,57,60], attack: 0.2
 sleep 0.5
 play_chord [43,50,57,60], attack: 0.8
 sleep 1.5
 play_pattern_timed [50,53,57],[0.5], attack: 0.5
 play_chord [40,50,56,59], attack: 1.8
 sleep 2
 play_pattern_timed [40,47,53,56],[0.5], attack: 0.5
 play_chord [36,52,55], attack: 0.8
 sleep 1
 play_chord [40,52,59], attack: 0.8
 sleep 1
 play_pattern_timed [56,57],[0.25], attack: 0.25
 play_pattern_timed [59],[0.5], attack: 0.5
 play_chord [36,48,55], attack: 0.8
 sleep 1
 play_chord [43,55,59], attack: 0.8
 sleep 1
 play_chord [40,52,55,59], attack: 0.8
 sleep 1
end
#coda section rh tune
#first 9 bars same as in verse 1
use_synth :saw_beep
play_pattern_timed [0,0,71,71],[0.25], attack: 0.25
play_pattern_timed [72,71,67],[0.5], attack: 0.5
play_pattern_timed [62,64,69],[0.25], attack: 0.25
play_pattern_timed [67],[0.75], attack: 0.75
play_pattern_timed [65],[1], attack: 1
play_pattern_timed [65,67,69],[0.333], attack: 0.333
play_pattern_timed [62,0,0],[1], attack: 1
play_pattern_timed [65,67,68],[0.333], attack: 0.333
play_pattern_timed [62],[1], attack: 1
play_pattern_timed [0,0],[0.5,0.25]
play_pattern_timed [62,74,72,71,69,68,69],[0.25], attack: 0.25
play_pattern_timed [71],[0.5], attack: 0.5
play_pattern_timed [0],[1]
play_pattern_timed [71,67,64,71,67,64],[0.167], attack: 0.167
play_pattern_timed [69],[0.25], attack: 0.25
play_pattern_timed [67],[1.25], attack: 1.25
play_pattern_timed [0],[0.5]
#lh thread last 5 bars time signature changes but beat kept constant length
in_thread do
 use_synth :saw_beep
 play_chord [36,48,55], attack: 1.3
 sleep 1.5
 play_chord [43,55,59], attack: 1.3
 sleep 1.5
 play_chord [36,48,55], attack: 0.7
 sleep 0.75
 play_chord [38,50,54,60], attack: 0.7
 sleep 0.75
 play_chord [36,48,52,55], attack: 0.8
 sleep 1
 play_chord [36,48,52,55], attack: 0.4
 sleep 0.5
 play_chord [36,48,52,55], attack: 0.4
 sleep 0.5
 play_chord [43,50,55,59], attack: 2
 sleep 2.5
end
#rh tune bar last 5 bars
play_pattern_timed [71,67,64,71,67,64,69],[0.25], attack: 0.25
play_pattern_timed [67],[1.25], attack: 1.25
play_pattern_timed [71,67,64,74,72,62,64],[0.25], attack: 0.25
play_pattern_timed [67],[1.75], attack: 1.75
play_chord [67,71,74], attack: 2
sleep 2.5
#end of piece
