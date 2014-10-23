#alternative FrereJaques using defined methods for each line by Robin Newman 12th October 2013
#played as a three part round. Also use of a global variable

$s = "beep" #synth to use. $s is global variable
def a #first line (played twice)
  with_synth $s
  play_pattern_timed [62,64,66,62],[0.25]
end
def b #third line of music (played twice)
  with_synth $s
  play_pattern_timed [66,67,69],[0.25,0.25,0.5]
end
def c #fifth line of music (played twice)
  with_synth $s 
  play_pattern_timed [69,71,69,67,66,62],[0.125,0.125,0.125,0.125,0.25,0.25]
end
def d #7th line of music (played twice)
  play_pattern_timed [62,57,62],[0.25,0.25,0.5]
end

#having defined the sections play the tune
a
a
in_thread do #start the second part here
  a
  a
  b
  b
  c
  c
  d
  d
end #end the second part
b
b
in_thread do #start the third part here
  a
  a
  b
  b
  c
  c
  d
  d
end #end third part
c
c
d
d #end the first part


