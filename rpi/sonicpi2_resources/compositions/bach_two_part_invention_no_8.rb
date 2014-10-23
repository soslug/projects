#Bach Two Part Invention no 8 coded by Robin Newman 21st October 2013
#score is here http://www.mutopiaproject.org/ftp/BachJS/BWV779/bach-invention-08/bach-invention-08-a4.pdf
#This illustrates the use of variables to allow tempo changes even though using the play_pattern_timed command
#Also shown is the use of multiple short in_thread structures to allow resynchronisation
#of the two hands. Each lasts for one, bar. If a Right Hand in_thread finishes early, then the next one does not start
#until the correct time is reached in the Left Hand part. To prevent the Left Hand part starting a Right Hand
#in_thread early a very short "bodge" sleep is inserted at end of each Left Hand bar. The timing of this "bodge"
#can be adjusted to give the smoothest performance, and in fact I think the very short delay that sometimes results
#enhances the performance.
#Also worth commenting is the use of $ variables which are global
#The with_synth command has to be used at the start of each thread, or it uses the default synth
#Separate synth variable names are used for the threads and the main program, so Left and Right parts can be different.
#only the saw_beep and beep synths work satisfactorily, without extraneous clicks and noises in the piece
#Attack times are specified with different variables to the note durations, allowing for staccato or sustained playing
#The whole piece is played several times allowing different parameter settings to be used
#'this is achieved by using the def tune...end structure, which allows the tune to be played with a single tune command


#setup initial timing variables
$m = 1  #multiplier for timing
$c = 0.5 * $m #crotchet ALWAYS THIS VALUE
$q = 0.25 * $m #quaver ALWAYS THIS VALUE
$s = 0.125 * $m #semi-quaver ALWAYS THIS VALUE
$qs = 0.175 * $m #staccato quaver attack < or = to $q
$ss = 0.125 * $m #staccato semi attack < or = to$s
$cr = 0.03625 * $m #sync correction...value by trial and error
$synR = "beep" #set synth as a global named variable for RIGHT hand. Allows single point changing
$synL = "saw_beep" #set synth as a global named variable for LEFT hand.

def tune #define the whole piece as tune so that it can be easily repeated with different parameters

  with_synth $synL

  in_thread do #b1 RIGHT HAND
    with_synth $synR
    sleep $q
    play_pattern_timed [65,69,65,72,65],[$q],"attack",$qs
  end

  sleep (3 * $c) #b1 LEFT HAND
  sleep $cr

  in_thread do #b2 RIGHT HAND
    with_synth $synR
    play_pattern_timed [77],[$q],"attack",$ss
    play_pattern_timed [76,74,72,74,72,70,69,70,69,67],[$s],"attack",$ss
  end

  sleep $q #b2 LEFT HAND
  play_pattern_timed [53,57,53,60,53],[$q],"attack",$qs
  sleep $cr

  in_thread do #b3 RIGHT HAND
    with_synth $synR
    play_pattern_timed [65,69,72,69,77,72],[$q],"attack",$qs
  end

  #b4 start LEFT HAND
  play_pattern_timed [65],[$q],"attack",$qs
  play_pattern_timed [64,62,60,62,60,58,57,58,57,55],[$s],"attack",$ss
  sleep $cr

  in_thread do #b4 RIGHT HAND
    with_synth $synR
    play_pattern_timed [81,84,82,84,81,84,82,84,81,84,82,84],[$s],"attack",$ss
  end

  #b4 start LEFT HAND
  play_pattern_timed [53,57,60,57,65,60],[$q],"attack",$qs
  sleep $cr

  in_thread do #b5 RIGHT HAND
    with_synth $synR
    play_pattern_timed [77,81,79,81,77,81,79,81,77,81,79,81],[$s],"attack",$ss
  end

  #b5 start LEFT HAND
  play_pattern_timed [69,72,70,72,69,72,70,72,69,72,70,72],[$s],"attack",$ss
  sleep $cr

  in_thread do #b6 RIGHT HAND
    with_synth $synR
    play_pattern_timed [74,77,76,77,74,77,76,77,74,77,76,77],[$s],"attack",$ss
  end

  #b6 start LEFT HAND
  play_pattern_timed [65,69,67,69,65,69,67,69,65,69,67,69],[$s],"attack",$ss
  sleep $cr

  in_thread do #b7 RIGHT HAND
    with_synth $synR
    play_pattern_timed [71,67,74,71,77,74],[$q],"attack",$qs
  end

  #b7 start LEFT HAND
  play_pattern_timed [62,65,64,65,62,65,64,65,62,65,64,65],[$s],"attack",$ss
  sleep $cr

  in_thread do #b8 RIGHT HAND
    with_synth $synR
    play_pattern_timed [79,81,79,77,76,77,76,74,72,74,72,70],[$s],"attack",$ss
  end

  #b8 start LEFT HAND
  play_pattern_timed [59,55,60,55,64,60],[$q],"attack",$qs
  sleep $cr

  in_thread do #b9 RIGHT HAND
    with_synth $synR
    play_pattern_timed [69],[$q],"attack",$qs
    play_pattern_timed [74,72,71,72,71,69,67,69,67,65],[$s],"attack",$ss
  end

  #b9 start LEFT HAND 
  play_pattern_timed [65,67,65,64,62,64,62,60,59,60,59,57],[$s],"attack",$ss
  sleep $cr

  in_thread do #b10 RIGHT HAND
    with_synth $synR
    play_pattern_timed [64,65,64,62],[$s],"attack",$ss
    play_pattern_timed [60],[$q],"attack",$qs
    play_pattern_timed [72,71],[$s],"attack",$ss
    play_pattern_timed [72,64],[$q],"attack",$qs
  end

  #b10 start LEFT HAND
  play_pattern_timed [55],[$q],"attack",$qs
  play_pattern_timed [60,59,57,59,57,55,53,55,53,52],[$s],"attack",$ss
  sleep $cr

  in_thread do #b11 RIGHT HAND
    with_synth $synR
    play_pattern_timed [65,72,64,72,62,71],[$q],"attack",$qs
  end

  #b11 start LEFT HAND
  play_pattern_timed [50,52,50,48,55,53,52,53],[$s],"attack",$ss
  play_pattern_timed [55,43],[$q],"attack",$qs
  sleep $cr

  in_thread do #b12 RIGHT HAND
    with_synth $synR
    play_pattern_timed [72],[$c],"attack",$c  #crotchet attack = duration 
    sleep (2 * $c)
  end

  #b12 start LEFT HAND
  sleep $q
  play_pattern_timed [48,52,48,55,48],[$q],"attack",$qs
  sleep $cr

  in_thread do #b13 RIGHT HAND
    with_synth $synR
    sleep $q
    play_pattern_timed [72,76,72,79,72],[$q],"attack",$qs
  end

  #b13 start LEFT HAND
  play_pattern_timed [60],[$q],"attack",$qs
  play_pattern_timed [59,57,55,57,55,53,52,53,52,50],[$s],"attack",$ss
  sleep $cr

  in_thread do #b14 RIGHT HAND
    with_synth $synR
    play_pattern_timed [84],[$q],"attack",$qs
    play_pattern_timed [83,81,79,81,79,77,76,77,76,74],[$s],"attack",$ss
  end

  #b14 start LEFT HAND
  play_pattern_timed [48,52,55,52,60,55],[$q],"attack",$qs
  sleep $cr

  in_thread do #b15 RIGHT HAND
    with_synth $synR
    play_pattern_timed [72,70,72,81,72,81,70,81,72,81,69,81],[$s],"attack",$ss
  end

  #b15 start LEFT HAND
  play_pattern_timed [63,54,63,54,63,54],[$q],"attack",$qs
  sleep $cr

  in_thread do #b16 RIGHT HAND
    with_synth $synR
    play_pattern_timed [70,67,70,67,74,67],[$q],"attack",$qs
  end

  #b16 start LEFT HAND
  play_pattern_timed [55],[$q],"attack",$qs
  play_pattern_timed [53,51,50,51,50,48,46,48,46,45],[$s],"attack",$ss
  sleep $cr

  in_thread do #b17 RIGHT HAND
    with_synth $synR
    play_pattern_timed [79],[$q],"attack",$qs
    play_pattern_timed [77,75,74,75,74,72,70,72,70,69],[$s],"attack",$ss
  end

  #b17 start LEFT HAND
  play_pattern_timed [43,55,58,55,62,55],[$q],"attack",$qs
  sleep $cr

  in_thread do #b18 RIGHT HAND
    with_synth $synR
    play_pattern_timed [67,70,74,70,79,74],[$q],"attack",$qs
  end

  #b18 start LEFT HAND
  play_pattern_timed [67],[$q],"attack",$qs
  play_pattern_timed [65,63,62,63,62,60,58,60,58,57],[$s],"attack",$ss
  sleep $cr

  in_thread do #b19 RIGHT HAND
    with_synth $synR
    play_pattern_timed [82,73,82,73,82,73],[$q],"attack",$qs
  end

  #b19 start LEFT HAND
  play_pattern_timed [55,53,55,64,55,64,53,64,55,64,52,64],[$s],"attack",$ss
  sleep $cr

  in_thread do #b20 RIGHT HAND
    with_synth $synR
    play_pattern_timed [74,69,77,74,81,77],[$q],"attack",$qs
  end

  #b20 start LEFT HAND
  play_pattern_timed [53,52,53,62,53,62,52,62,53,62,50,62],[$s],"attack",$ss
  sleep $cr

  in_thread do #b21 RIGHT HAND
    with_synth $synR
    play_pattern_timed [79,77,79,82,72,82,74,82,76,82,72,82],[$s],"attack",$ss
  end

  #b21 start LEFT HAND
  play_pattern_timed [58,55,52,55,48,52],[$q],"attack",$qs
  sleep $cr

  in_thread do #b22 RIGHT HAND
    with_synth $synR
    play_pattern_timed [77,76,77,81,71,81,73,81,74,81,71,81],[$s],"attack",$ss
  end

  #b22 start LEFT HAND
  play_pattern_timed [57,53,50,53,47,50],[$q],"attack",$qs
  sleep $cr

  in_thread do #b23 RIGHT HAND
    with_synth $synR
    play_pattern_timed [76,74,76,79,69,79,71,79,73,79,69,79],[$s],"attack",$ss
  end

  #b23 start LEFT HAND
  play_pattern_timed [55,52,49,52,45,49],[$q],"attack",$qs
  sleep $cr

  in_thread do #b24 RIGHT HAND
    with_synth $synR
    play_pattern_timed [77,74,70,74,67,77],[$q],"attack",$qs
  end

  #b24 start LEFT HAND
  play_pattern_timed [38,50,48,50,43,50,45,50,46,50,43,50],[$s],"attack",$ss
  sleep $cr

  in_thread do #b25 RIGHT HAND
    with_synth $synR
    play_pattern_timed [76,72,69,72,65,75],[$q],"attack",$qs
  end

  #b25 start LEFT HAND
  play_pattern_timed [36,48,46,48,41,48,43,48,45,48,41,48],[$s],"attack",$ss
  sleep $cr

  in_thread do #b26 RIGHT HAND
    with_synth $synR
    play_pattern_timed [74,77,75,77,74,77,75,77,74,77,75,77],[$s],"attack",$ss
  end


  #b26 start LEFT HAND
  play_pattern_timed [46,50,53,50,58,53],[$q],"attack",$qs
  sleep $cr

  in_thread do #b27 RIGHT HAND
    with_synth $synR
    play_pattern_timed [70,74,72,74,70,74,72,74,70,74,72,74],[$s],"attack",$ss
  end

  #b27 start LEFT HAND
  play_pattern_timed [62,65,63,65,62,65,63,65,62,65,63,65],[$s],"attack",$ss
  sleep $cr

  in_thread do #b28 RIGHT HAND
    with_synth $synR
    play_pattern_timed [67,70,69,70,67,70,69,70,67,70,69,70],[$s],"attack",$ss
  end

  #b28 start LEFT HAND
  play_pattern_timed [58,62,60,62,58,62,60,62,58,62,60,62],[$s],"attack",$ss
  sleep $cr

  in_thread do #b29 RIGHT HAND
    with_synth $synR
    play_pattern_timed [64,60,67,64,70,67],[$q],"attack",$qs
  end

  #b29 start LEFT HAND
  play_pattern_timed [55,58,57,58,55,58,57,58,55,58,57,58],[$s],"attack",$ss
  sleep $cr

  in_thread do #b30 RIGHT HAND
    with_synth $synR
    play_pattern_timed [72,74,72,70,69,70,69,67,65,67,65,63],[$s],"attack",$ss
  end

  #b30 start LEFT HAND
  play_pattern_timed [52,48,53,48,57,53],[$q],"attack",$qs
  sleep $cr

  in_thread do #b31 RIGHT HAND
    with_synth $synR
    play_pattern_timed [62],[$q],"attack",$qs
    play_pattern_timed [67,65,64,65,64,62,60,62,60,58],[$s],"attack",$ss
  end

  #b31 start LEFT HAND
  play_pattern_timed [58,60,58,57,55,57,55,53,52,53,52,50],[$s],"attack",$ss
  sleep $cr

  in_thread do #b32 RIGHT HAND
    with_synth $synR
    play_pattern_timed [57,58,57,55],[$s],"attack",$ss
    play_pattern_timed [53],[$q],"attack",$qs
    play_pattern_timed [65,64],[$s],"attack",$ss
    play_pattern_timed [65,57],[$q],"attack",$qs
  end

  #b32 start LEFT HAND
  play_pattern_timed [48],[$q],"attack",$qs
  play_pattern_timed [53,52,50,52,50,48,46,48,46,45],[$s],"attack",$ss
  sleep $cr

  in_thread do #b33 RIGHT HAND
    with_synth $synR
    play_pattern_timed [58,65,57,65,55,64],[$q],"attack",$qs
  end

  #b33 start LEFT HAND
  play_pattern_timed [43,45,43,41,48,46,45,46],[$s],"attack",$ss
  play_pattern_timed [48,36],[$q],"attack",$qs
  sleep $cr

  in_thread do #b34 RIGHT HAND
    with_synth $synR
    play_chord [57,60,65],"attack",$c
    sleep (3 * $c)
  end

  #b34 start LEFT HAND
  play_pattern_timed [41],[$c],"attack",$c #attack set to duration here
  sleep (2 * $c)
end #of tune definition

########Play tune several times with different settings#######
#slow different synth each hand
$m = 1.4  #multiplier for timing
$c = 0.5 * $m #crotchet ALWAYS THIS VALUE
$q = 0.25 * $m #quaver ALWAYS THIS VALUE
$s = 0.125 * $m #semi-quaver ALWAYS THIS VALUE
$qs = 0.15 * $m #staccato quaver attack < or = to $q
$ss = 0.125 * $m #staccato semi attack < or = to$s
$cr = 0.03625 * $m #sync correction...value by trial and error
$synR = "beep" #set synth as a global named variable for RIGHT hand. Allows single point changing
$synL = "saw_beep" #set synth as a global named variable for LEFT hand.
#play tune
tune

#bit faster, same synth both hands
$m = 1.2  #multiplier for timing
$c = 0.5 * $m #crotchet ALWAYS THIS VALUE
$q = 0.25 * $m #quaver ALWAYS THIS VALUE
$s = 0.125 * $m #semi-quaver ALWAYS THIS VALUE
$qs = 0.2 * $m #staccato quaver attack < or = to $q
$ss = 0.125 * $m #staccato semi attack < or = to$s
$cr = 0.03625 * $m #sync correction...value by trial and error
$synR = "saw_beep" #set synth as a global named variable for RIGHT hand. Allows single point changing
$synL = "saw_beep" #set synth as a global named variable for LEFT hand.
#play tune
tune

#moderate temop, different synths each hand
$m = 1  #multiplier for timing
$c = 0.5 * $m #crotchet ALWAYS THIS VALUE
$q = 0.25 * $m #quaver ALWAYS THIS VALUE
$s = 0.125 * $m #semi-quaver ALWAYS THIS VALUE
$qs = 0.125 * $m #staccato quaver attack < or = to $q
$ss = 0.125 * $m #staccato semi attack < or = to$s
$cr = 0.03625 * $m #sync correction...value by trial and error
$synR = "beep" #set synth as a global named variable for RIGHT hand. Allows single point changing
$synL = "saw_beep" #set synth as a global named variable for LEFT hand.
#play tune
tune

#fast same synth each hand
$m = 0.8  #multiplier for timing
$c = 0.5 * $m #crotchet ALWAYS THIS VALUE
$q = 0.25 * $m #quaver ALWAYS THIS VALUE
$s = 0.125 * $m #semi-quaver ALWAYS THIS VALUE
$qs = 0.125 * $m #staccato quaver attack < or = to $q
$ss = 0.120 * $m #staccato semi attack < or = to$s
$cr = 0.03625 * $m #sync correction...value by trial and error
$synR = "saw_beep" #set synth as a global named variable for RIGHT hand. Allows single point changing
$synL = "saw_beep" #set synth as a global named variable for LEFT hand.
#play tune
tune

#super fast. different synth each hand
$m = 0.6  #multiplier for timing
$c = 0.5 * $m #crotchet ALWAYS THIS VALUE
$q = 0.25 * $m #quaver ALWAYS THIS VALUE
$s = 0.125 * $m #semi-quaver ALWAYS THIS VALUE
$qs = 0.125 * $m #staccato quaver attack < or = to $q
$ss = 0.120 * $m #staccato semi attack < or = to$s
$cr = 0.03625 * $m #sync correction...value by trial and error
$synR = "beep" #set synth as a global named variable for RIGHT hand. Allows single point changing
$synL = "saw_beep" #set synth as a global named variable for LEFT hand.
#play tune
tune

