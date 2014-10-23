#frerejacques three part round. This works ok with saw_beep synth
with_synth "saw_beep"
play_pattern_timed [60,62,64,60,60,62,64,60],[0.25]
# now start the second part in a parallel thread
in_thread do
  with_synth "saw_beep"
#only 1 time in first phrase, as all notes same length, and so only need 1  0.25 in the play_pattern_timed list
  play_pattern_timed [60,62,64,60,60,62,64,60],[0.25]
  play_pattern_timed [64,65,67,64,65,67],[0.25,0.25,0.5,0.25,0.25,0.5]
  play_pattern_timed [67,69,67,65,64,60],[0.125,0.125,0.125,0.125,0.25,0.25]
  play_pattern_timed [67,69,67,65,64,60],[0.125,0.125,0.125,0.125,0.25,0.25]
  play_pattern_timed [60,55,60,60,55,60],[0.25,0.25,0.5,0.25,0.25,0.5]
end
# the first part continues here, playing in parallel with the thread
play_pattern_timed [64,65,67,64,65,67],[0.25,0.25,0.5,0.25,0.25,0.5]
#now start the third part in a second parallel thread
in_thread do
  with_synth "saw_beep"
#only 1 time in first phrase, as all notes same length, and so only need 1  0.25 in the play_pattern_timed list
  play_pattern_timed [60,62,64,60,60,62,64,60],[0.25]
  play_pattern_timed [64,65,67,64,65,67],[0.25,0.25,0.5,0.25,0.25,0.5]
  play_pattern_timed [67,69,67,65,64,60],[0.125,0.125,0.125,0.125,0.25,0.25]
  play_pattern_timed [67,69,67,65,64,60],[0.125,0.125,0.125,0.125,0.25,0.25]
  play_pattern_timed [60,55,60,60,55,60],[0.25,0.25,0.5,0.25,0.25,0.5]
end
#the remainder of the main part is here
play_pattern_timed [67,69,67,65,64,60],[0.125,0.125,0.125,0.125,0.25,0.25]
play_pattern_timed [67,69,67,65,64,60],[0.125,0.125,0.125,0.125,0.25,0.25]
play_pattern_timed [60,55,60,60,55,60],[0.25,0.25,0.5,0.25,0.25,0.5]
