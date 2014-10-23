#My first piece is Frerejacques played as a two part round. I tried three parts, but Sonic-Pi (on my 256Mb Pi) doesn;t like #having more than one in-thread playing at a time. Copy and paste the tune after the divider.

#=================================================================

# Frere Jacques as a simple two part round
# The second part starts after the first play_pattern_timed
# has completed the first phrase
# The second part is contained in a thread that plays in parallel
# By Robin Newman Sept 2013
# only 1 time in first phrase, as all notes same length, and so only need 1  0.25 in the play_pattern_timed list

play_pattern_timed [60,62,64,60,60,62,64,60],[0.25]
# now start the second part in a parallel thread
in_thread do
  #only 1 time in first phrase, as all notes same length, and so only need 1  0.25 in the play_pattern_timed list
  play_pattern_timed [60,62,64,60,60,62,64,60],[0.25]
  play_pattern_timed [64,65,67,64,65,67],[0.25,0.25,0.5,0.25,0.25,0.5]
  play_pattern_timed [67,69,67,65,64,60],[0.125,0.125,0.125,0.125,0.25,0.25]
  play_pattern_timed [67,69,67,65,64,60],[0.125,0.125,0.125,0.125,0.25,0.25]
  play_pattern_timed [60,55,60,60,55,60],[0.25,0.25,0.5,0.25,0.25,0.5]
end
# the first part continues here, playing in parallel with the thread
play_pattern_timed [64,65,67,64,65,67],[0.25,0.25,0.5,0.25,0.25,0.5]
play_pattern_timed [67,69,67,65,64,60],[0.125,0.125,0.125,0.125,0.25,0.25]
play_pattern_timed [67,69,67,65,64,60],[0.125,0.125,0.125,0.125,0.25,0.25]
play_pattern_timed [60,55,60,60,55,60],[0.25,0.25,0.5,0.25,0.25,0.5]
