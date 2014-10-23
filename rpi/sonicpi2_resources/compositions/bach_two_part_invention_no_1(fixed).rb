#Bach Two Part Invention no 1 coded by Robin Newman 23rd October 2013
#score from http://www.free-scores.com/PDF_EN/bach-johann-sebastian-invention-177.pdf
#This illustrates the use of varaibles to allow tempo changes even though using the play_pattern_timed command
#Also shown is the use of multiple short in_thread structures to allow resynchronisation
#of the two hands. Each lasts for one, bar. If a Right Hand in_thread finishes early, then the next one does not start
#until the correct time is reached in the Left Hand part. To prevent the Left Hand part starting a Right Hand
#in_thread early a very short "bodge" sleep is inserted at end of each Left Hand bar. The timing of this "bodge"
#can be adjusted to give the smoothest performance, and in fact I think the very short delay that sometimes results
#enhances the performance.
#Also worth commenting is the use of $ variables which are global
#The use_synth command has to be used at the start of each thread, or it uses the default synth
#Separate variable names are used for the threads and the main program, so Left and Right parts can be different.
#only the saw_beep and beep synths work satisfactorily, withough extraneous clicks and noises in the piece
#Attack times are specified with different variables to the note durations, allowing for stacatto or sustained playing
#tricky bits were producing the ornamental mordents, which had to be written out explicitly.
#The whole piece is played several times allowing different parameter settings to be used
#'this is achieved by using the def tune...end structure, which allows the tune to be played with a single tune command


#setup initial timing variables
$m = 1  #multiplier for timing
$c = 0.5 * $m #crotchet ALWAYS THIS VALUE
$q = 0.25 * $m #quaver ALWAYS THIS VALUE
$s = 0.125 * $m #semi-quaver ALWAYS THIS VALUE
$d = 0.0625 * $m #demi-semi-quaver ALWAYS THIS VALUE 
$qs = 0.175 * $m #stacatto quaver attack < or = to $q
$ss = 0.125 * $m #stacatto semi attack < or = to$s
$ds = 0.0625 * $m #staccato demi-semi attack < or = to $d
$cr = 0.03625 * $m #sync correction...value by trial and error
$synR = :beep #set synth as a global named variable for RIGHT hand. Allows single point changing
$synL = :saw_beep #set synth as a global named variable for LEFT hand.

def tune #define the whole piece as tune so that it can be easily repeated with different parameters

  use_synth $synL

  in_thread do #b1 RIGHT HAND
    use_synth $synR
    sleep $s
    play_pattern_timed [60,62,64,65,62,64,60],[$s],attack: $ss
    play_pattern_timed [67,72],[$q],attack: $qs
    play_pattern_timed [71,72],[($d / 2)],attack: ($ds / 2)
    play_pattern_timed [71],[($d + $s)],attack: ($ds + $ss)
    play_pattern_timed [72],[$q],attack: $qs
  end

  sleep (2 * $c + $s) #b1 LEFT HAND
  play_pattern_timed [48,50,52,53,50,52,48],[$s],attack: $ss
  sleep $cr

  in_thread do #b2 RIGHT HAND
    use_synth $synR
    play_pattern_timed [74,67,69,71,72,69,71,67],[$s],attack: $ss
    play_pattern_timed [74,79],[$q],attack: $qs
    play_pattern_timed [77,79],[($d / 2)],attack: ($ds / 2)
    play_pattern_timed [77],[($d + $s)],attack: ($ds + $ss)
    play_pattern_timed [79],[$q],attack: $qs
  end
  #b2 LEFT HAND
  play_pattern_timed [55,43],[$q],attack: $qs
  sleep ($c + $s)  
  play_pattern_timed [55,57,59,60,57,59,55],[$s],attack: $ss
  sleep $cr

  in_thread do #b3 RIGHT HAND
    use_synth $synR
    play_pattern_timed [76,81,79,77,76,79,77,81,79,77,76,74,72,76,74,77],[$s],attack: $ss
  end

  #b3 start LEFT HAND
  play_pattern_timed [60,59,60,62,64,55,57,59],[$q],attack: $q 
  sleep $cr

  in_thread do #b4 RIGHT HAND
    use_synth $synR
    play_pattern_timed [76,74,72,71,69,72,71,74,72,71,69,67,66,69,67,71],[$s],attack: $ss
  end

  #b4 start LEFT HAND
  play_pattern_timed [60,52,54,55,57,59],[$q],attack: $q
  play_pattern_timed [60],[$c],attack: $c
  sleep $cr

  in_thread do #b5 RIGHT HAND
    use_synth $synR
    play_pattern_timed [69,62],[$q],attack: $qs
    play_pattern_timed [72,74],[($d / 2)],attack: ($ds / 2)
    play_pattern_timed [72],[($d + $q)],attack: ($ds + $qs)
    play_pattern_timed [74,71,69,67,66,64,67,66,69],[$s],attack: $ss
  end

  #b5 start LEFT HAND
  play_pattern_timed [60,50,52,54,55,52,54,50],[$s],attack: $ss
  play_pattern_timed [55,47,48,50],[$q],attack: $qs
  sleep $cr

  in_thread do #b6 RIGHT HAND
    use_synth $synR
    play_pattern_timed [67,71,69,72,71,74,72,76,74],[$s],attack: $ss
    play_pattern_timed [71,72],[$d],attack: $ds
    play_pattern_timed [74,79],[$s],attack: $ss
    play_pattern_timed [71,72],[($d /2)],attack: ($ds / 2)
    play_pattern_timed [71],[($d + $s)],attack: ($ds + $ss)
    play_pattern_timed [69,67],[$s],attack: $ss
  end

  #b6 start LEFT HAND
  play_pattern_timed [52,54,55,52],[$q],attack: $qs
  play_pattern_timed [47],[($q + $s)],attack: ($q + $s)
  play_pattern_timed [48],[$s],attack: $s
  play_pattern_timed [50,38],[$q],attack: $q
  sleep $cr

  in_thread do #b7 RIGHT HAND
    use_synth $synR
    play_pattern_timed [67],[$q],attack: $qs
    sleep ($c + $q + $s)
    play_pattern_timed [67,69,71,72,69,71,67],[$s],attack: $ss
  end

  #b7 start LEFT HAND6
  sleep $s
  play_pattern_timed [43,45,47,48,45,47,43],[$s],attack: $ss
  play_pattern_timed [50,55],[$q],attack: $qs
  play_pattern_timed [54,55],[($d / 2)],attack: ($ds / 2)
  play_pattern_timed [54],[($d + $s)],attack: ($ds + $ss)
  play_pattern_timed [55],[$q],attack: $qs
  sleep $cr

  in_thread do #b8 RIGHT HAND
    use_synth $synR
    play_pattern_timed [66],[$q],attack: $qs
    sleep ($q + $c + $s)
    play_pattern_timed [69,71,72,74,71,72,69],[$s],attack: $ss
  end

  #b8 start LEFT HAND
  play_pattern_timed [57,50,52,54,55,52,54,50],[$s],attack: $ss
  play_pattern_timed [57,62],[$q],attack: $qs
  play_pattern_timed [60,62],[($d / 2)],attack: ($ds / 2)
  play_pattern_timed [60],[($d + $s)],attack: ($ds + $ss)
  play_pattern_timed [62],[$q],attack: $qs
  sleep $cr

  in_thread do #b9 RIGHT HAND
    use_synth $synR
    play_pattern_timed [71],[$q],attack: $qs
    sleep ($q + $c + $s)
    play_pattern_timed [74,72,71,69,72,71,74],[$s],attack: $ss
  end

  #b9 start LEFT HAND 
  play_pattern_timed [55,67,65,64,62,65,64,67],[$s],attack: $ss
  play_pattern_timed [65,64,65,62],[$q],attack: $qs
  sleep $cr

  in_thread do #b10 RIGHT HAND
    use_synth $synR
    play_pattern_timed [72],[$q],attack: $qs
    sleep ($q + $c + $s)
    play_pattern_timed [76,74,72,71,74,73,76],[$s],attack: $ss
  end

  #b10 start LEFT HAND
  play_pattern_timed [64,69,67,65,64,67,65,69],[$s],attack: $ss
  play_pattern_timed [67,65,67,64],[$q],attack: $qs
  sleep $cr

  in_thread do #b11 RIGHT HAND
    use_synth $synR
    play_pattern_timed [74,73,74,76,77,69,71,72],[$q],attack: $qs
  end

  #b11 start LEFT HAND
  play_pattern_timed [65,70,69,67,65,69,67,70,69,67,65,64,62,65,64,67],[$s],attack: $ss
  sleep $cr

  in_thread do #b12 RIGHT HAND
    use_synth $synR
    play_pattern_timed [74,66,68,69,71,72],[$q],attack: $qs
    play_pattern_timed [74],[$c],attack: $c #full length
  end

  #b12 start LEFT HAND
  play_pattern_timed [65,64,62,60,59,62,60,64,62,60,59,57,56,59,57,60],[$s],attack: $ss
  sleep $cr

  in_thread do #b13 RIGHT HAND
    use_synth $synR
    play_pattern_timed [74,64,66,68,69,66,68,64,76,74,72,76,74,72,71,74],[$s],attack: $ss
  end

  #b13 start LEFT HAND
  play_pattern_timed [59,52],[$q],attack: $qs
  play_pattern_timed [62,64],[($d / 2)],attack: ($ds / 2)
  play_pattern_timed [62],[($d + 2 * $s)],attack: ($ds + 2 * $ss)
  play_pattern_timed [64,60,59,57,55,54,57,56,59],[$s],attack: $ss
 sleep $cr

  in_thread do #b14 RIGHT HAND
    use_synth $synR
    play_pattern_timed [72,81,80,83,81,76,77,74,68,77,76,74],[$s],attack: $ss
    play_pattern_timed [72,74],[($d / 2)],attack: ($ds / 2)
    play_pattern_timed [72],[($d + $s)],attack: ($ds + $ss)
    play_pattern_timed [71,69],[$s],attack: $ss
  end

  #b14 LEFT HAND
  play_pattern_timed [57,60,59,62,60,64,62,65],[$s],attack: $ss
  play_pattern_timed [64,57,64,52],[$q],attack: $qs
  sleep $cr

  in_thread do #b15 RIGHT HAND
    use_synth $synR
    play_pattern_timed [69,81,79,77,76,79,77,81],[$s],attack: $ss
    play_pattern_timed [79],[($c * 2)],attack: ($c * 2) #full length
  end

  #b15 LEFT HAND
  play_pattern_timed [57,45],[$q],attack: $qs
  sleep ($c + $q)
  play_pattern_timed [64,62,60,59,62,61,64],[$s],attack: $ss
  sleep $cr

  in_thread do #b16 RIGHT HAND
    use_synth $synR
    play_pattern_timed [79,76,77,79,81,77,79,76],[$s],attack: $ss
    play_pattern_timed [77],[(2 * $c)],attack: (2 * $c) #full length
  end

  #b16 start LEFT HAND
  play_pattern_timed [62],[(2 * $c)],attack: (2 * $c) #full length
  play_pattern_timed [62,57,59,60,62,59,60,57],[$s],attack: $ss
  sleep $cr

  in_thread do #b17 RIGHT HAND
    use_synth $synR
    play_pattern_timed [77,79,77,76,74,77,76,79],[$s],attack: $ss
    play_pattern_timed [77],[($c * 2)],attack: ($c * 2) #full length
  end

  #b17 start LEFT HAND
  play_pattern_timed [59],[($c * 2)],attack: ($c * 2) #full length
  play_pattern_timed [59,62,60,59,57,60,59,62],[$s],attack: $ss
  sleep $cr

  in_thread do #b18 RIGHT HAND
    use_synth $synR
    play_pattern_timed [77,74,76,77,79,76,77,74],[$s],attack: $ss
    play_pattern_timed [76],[($c * 2)],attack: ($c * 2) #full length
  end

  #b18 start LEFT HAND
  play_pattern_timed [60],[($c * 2)],attack: ($c * 2) #full length
  play_pattern_timed [60,55,57,58,60,57,58,55],[$s],attack: $ss
  sleep $cr

  in_thread do #b19 RIGHT HAND
    use_synth $synR
    play_pattern_timed [76,72,74,76,77,74,76,72,74,76,77,79,81,77,79,76],[$s],attack: $ss
  end

  #b19 start LEFT HAND
  play_pattern_timed [57],[$q],attack: $qs
  play_pattern_timed [58,57,55],[$q],attack: $q #smooth full length
  play_pattern_timed [53],[$q],attack: $qs
  play_pattern_timed [62,60,58],[$q],attack: $q #smooth full length
 sleep $cr

  in_thread do #b20 RIGHT HAND
    use_synth $synR
    play_pattern_timed [77,79,81,83,84,81,83,79],[$s],attack: $ss
    play_pattern_timed [84,79],[$q],attack: $qs
    play_pattern_timed [76,77],[($d / 2)],attack: ($ds / 2)
    play_pattern_timed [76],[($d + $s)],attack: ($ds + $ss)
    play_pattern_timed [74,72],[$s],attack: $ss
  end

  #b20 start LEFT HAND
  play_pattern_timed [57],[$q],attack: $qs
  play_pattern_timed [65,64,62],[$q],attack: $q #full length
  play_pattern_timed [64,50,52,53,55,52,53,50],[$s],attack: $ss
  sleep $cr

  in_thread do #b21 RIGHT HAND
    use_synth $synR
    play_pattern_timed [72,70,69,67,65,69,67,70,69,71,72,64,62,72,65,71],[$s],attack: $ss
  end

  #b21 start LEFT HAND
  play_pattern_timed [52,48,50,52],[$q],attack: $qs
  play_pattern_timed [53,50,52,53],[$s],attack: $ss
  play_pattern_timed [55,43],[$q],attack: $qs
  sleep $cr

  in_thread do #b22 RIGHT HAND
    use_synth $synR
    play_chord [52,55,72],attack: ($c * 4)
  end

  #b22 start LEFT HAND
  use_synth :beep #override synth for the chord
  play_chord [36,48],attack: ($c * 4)
  sleep $cr

  sleep (4 * $c) #bar before next tune

end #of tune definition

########Play tune several times with different settings#######
#slow same synth each hand
$m = 1.6  #multiplier for timing
$c = 0.5 * $m #crotchet ALWAYS THIS VALUE
$q = 0.25 * $m #quaver ALWAYS THIS VALUE
$s = 0.125 * $m #semi-quaver ALWAYS THIS VALUE
$d = 0.0625 * $m #demi-semi-quaver ALWAYS THIS VALUE 
$qs = 0.175 * $m #stacatto quaver attack < or = to $q
$ss = 0.125 * $m #stacatto semi attack < or = to$s
$ds = 0.0625 * $m #staccato demi-semi attack < or = to $d
$cr = 0.02 * $m #sync correction...value by trial and error
$synR = :beep #set synth as a global named variable for RIGHT hand. Allows single point changing
$synL = :beep #set synth as a global named variable for LEFT hand.
#play tune
tune

#bit faster, different synth each hand
$m = 1.2  #multiplier for timing
$c = 0.5 * $m #crotchet ALWAYS THIS VALUE
$q = 0.25 * $m #quaver ALWAYS THIS VALUE
$s = 0.125 * $m #semi-quaver ALWAYS THIS VALUE
$d = 0.0625 * $m #demi-semi-quaver ALWAYS THIS VALUE 
$qs = 0.2 * $m #stacatto quaver attack < or = to $q
$ss = 0.125 * $m #stacatto semi attack < or = to$s
$ds = 0.0625 * $m #staccato demi-semi attack < or = to $d
$cr = 0.018125 * $m #sync correction...value by trial and error
$synR = :beep #set synth as a global named variable for RIGHT hand. Allows single point changing
$synL = :beep #set synth as a global named variable for LEFT hand.
#play tune
tune

#little faster, different synths each hand
$m = 1.3  #multiplier for timing
$c = 0.5 * $m #crotchet ALWAYS THIS VALUE
$q = 0.25 * $m #quaver ALWAYS THIS VALUE
$s = 0.125 * $m #semi-quaver ALWAYS THIS VALUE
$d = 0.0625 * $m #demi-semi-quaver ALWAYS THIS VALUE 
$qs = 0.125 * $m #stacatto quaver attack < or = to $q
$ss = 0.125 * $m #stacatto semi attack < or = to$s
$ds = 0.0625 * $m #staccato demi-semi attack < or = to $d
$cr = 0.018125 * $m #sync correction...value by trial and error
$synR = :beep #set synth as a global named variable for RIGHT hand. Allows single point changing
$synL = :beep #set synth as a global named variable for LEFT hand.
#play tune
tune

#fast same synth each hand
$m = 1.2  #multiplier for timing
$c = 0.5 * $m #crotchet ALWAYS THIS VALUE
$q = 0.25 * $m #quaver ALWAYS THIS VALUE
$s = 0.125 * $m #semi-quaver ALWAYS THIS VALUE
$d = 0.0625 * $m #demi-semi-quaver ALWAYS THIS VALUE 
$qs = 0.125 * $m #stacatto quaver attack < or = to $q
$ss = 0.120 * $m #stacatto semi attack < or = to$s
$ds = 0.0625 * $m #staccato demi-semi attack < or = to $d
$cr = 0.018125 * $m #sync correction...value by trial and error
$synR = :beep #set synth as a global named variable for RIGHT hand. Allows single point changing
$synL = :beep #set synth as a global named variable for LEFT hand.
#play tune
tune

#super fast. different synth each hand
$m = 1 #multiplier for timing
$c = 0.5 * $m #crotchet ALWAYS THIS VALUE
$q = 0.25 * $m #quaver ALWAYS THIS VALUE
$s = 0.125 * $m #semi-quaver ALWAYS THIS VALUE
$d = 0.0625 * $m #demi-semi-quaver ALWAYS THIS VALUE 
$qs = 0.125 * $m #stacatto quaver attack < or = to $q
$ss = 0.120 * $m #stacatto semi attack < or = to$s
$ds = 0.0625 * $m #staccato demi-semi attack < or = to $d
$cr = 0.018125 * $m #sync correction...value by trial and error
$synR = :beep #set synth as a global named variable for RIGHT hand. Allows single point changing
$synL = :beep #set synth as a global named variable for LEFT hand.
#play tune
tune

