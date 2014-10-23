#Bach Two Part Invention no 4 coded by Robin Newman 21st October 2013
#score is here http://www.mutopiaproject.org/ftp/BachJS/BWV775/bach-invention-04/bach-invention-04-a4.pdf
#This illustrates the use of variables to allow tempo changes even though using the play_pattern_timed command
#Also shown is the use of multiple short in_thread structures to allow resynchronisation
#of the two hands. Each lasts for one, bar. If a Right Hand in_thread finishes early, then the next one does not start
#until the correct time is reached in the Left Hand part. To prevent the Left Hand part starting a Right Hand
#in_thread early a very short "bodge" sleep is inserted at end of each Left Hand bar. The timing of this "bodge"
#can be adjusted to give the smoothest performance, and in fact I think the very short delay that sometimes results
#enhances the performance. Occasionally there are two bar patterns to accommodate ties over the barline.
#Also worth commenting is the use of $ variables which are global
#The use_synth command has to be used at the start of each thread, or it uses the default synth
#Separate variable names are used for the threads and the main program, so Left and Right parts can be different.
#only the saw_beep and beep synths work satisfactorily, withough extraneous clicks and noises in the piece
#Attack times are specified with different variables to the note durations, allowing for staccato or sustained playing
#The whole piece is played several times allowing different parameter settings to be used
#'this is achieved by using the def tune...end structure, which allows the tune to be played with a single tune command


#setup initial timing variables
$m = 1  #multiplier for timing
$c = 0.5 * $m #crotchet ALWAYS THIS VALUE
$q = 0.25 * $m #quaver ALWAYS THIS VALUE
$s = 0.125 * $m #semi-quaver ALWAYS THIS VALUE
$d = 0.0625 * $m #demi-semi-quaver ALWAYS THIS VALUE 
$qs = 0.175 * $m #staccato quaver attack < or = to $q
$ss = 0.125 * $m #staccato semi attack < or = to$s
$ds = 0.0625 * $m #staccato demi-semi attack < or = to $d
$cr = 0.03625 * $m #sync correction...value by trial and error
$synR =  :beep #set synth as a global named variable for RIGHT hand. Allows single point changing
$synL = :saw_beep #set synth as a global named variable for LEFT hand.

def tune #define the whole piece as tune so that it can be easily repeated with different parameters

  use_synth $synL

  in_thread do #b1 RIGHT HAND
    use_synth $synR
    play_pattern_timed [62,64,65,67,69,70],[$s], attack: $ss
  end

  sleep (3 * $q) #b1 LEFT HAND

  in_thread do #b2 RIGHT HAND
    use_synth $synR
    play_pattern_timed [61,70,69,67,65,64,62],[$s], attack: $ss
  end

  sleep (3 * $q) #b2 LEFT HAND
  sleep $cr

  in_thread do #b3 RIGHT HAND
    use_synth $synR
    play_pattern_timed [65,69,74],[$q], attack: $qs
  end

  #b4 start LEFT HAND
  play_pattern_timed [50,52,53,55,57,58],[$s], attack: $ss 
  sleep $cr

  in_thread do #b4 RIGHT HAND
    use_synth $synR
    play_pattern_timed [67,73,76],[$q], attack: $qs
  end

  #b4 start LEFT HAND
  play_pattern_timed [49,58,57,55,53,52],[$s], attack: $ss
  sleep $cr

  in_thread do #b5 RIGHT HAND
    use_synth $synR
    play_pattern_timed [74,76,77,79,81,82],[$s], attack: $ss
  end

  #b5 start LEFT HAND
  play_pattern_timed [53,57,62],[$q], attack: $qs
  sleep $cr

  in_thread do #b6 RIGHT HAND
    use_synth $synR
    play_pattern_timed [73,82,81,79,77,76],[$s], attack: $ss
  end

  #b6 start LEFT HAND
  play_pattern_timed [52,55,61],[$q], attack: $qs
  sleep $cr

  in_thread do #b7 RIGHT HAND
    use_synth $synR
    play_pattern_timed [77,74,76,77,79,81],[$s], attack: $ss
  end

  #b7 start LEFT HAND
  play_pattern_timed [50,62,53],[$q], attack: $qs
  sleep $cr

  in_thread do #b8 RIGHT HAND
    use_synth $synR
    play_pattern_timed [71,81,79,77,76,74],[$s], attack: $ss
  end

  #b8 start LEFT HAND
  play_pattern_timed [55,57,58],[$q], attack: $qs
  sleep $cr

  in_thread do #b9 RIGHT HAND
    use_synth $synR
    play_pattern_timed [76,72,74,76,77,79],[$s], attack: $ss
  end

  #b9 start LEFT HAND 
  play_pattern_timed [48,60,52],[$q], attack: $qs #b9
  sleep $cr

  in_thread do #b10 RIGHT HAND
    use_synth $synR
    play_pattern_timed [69,79,77,76,74,72],[$s], attack: $ss
  end

  #b10 start LEFT HAND
  play_pattern_timed [53,55,57],[$q], attack: $qs
  sleep $cr

  in_thread do #b11 RIGHT HAND
    use_synth $synR
    play_pattern_timed [74,76,77,74,76,77],[$s], attack: $ss
  end

  #b11 start LEFT HAND
  play_pattern_timed [58,55,57,58,60,62],[$s], attack: $ss
  sleep $cr

  in_thread do #b12 RIGHT HAND
    use_synth $synR
    play_pattern_timed [67],[$q], attack: $sq
    sleep (2 * $q)
  end

  #b12 start LEFT HAND
  play_pattern_timed [52,62,60,58,57,55],[$s], attack: $ss
  sleep $cr

  in_thread do #b13 RIGHT HAND
    use_synth $synR
    play_pattern_timed [72,74,76,72,74,76],[$s], attack: $ss
  end

  #b13 start LEFT HAND
  play_pattern_timed [57,53,55,57,58,60],[$s], attack: $ss
  sleep $cr

  in_thread do #b14 and 15 RIGHT HAND
    use_synth $synR
    play_pattern_timed [65],[$q], attack: $qs
    sleep $q 
    play_pattern_timed [70],[$c], attack: $c
    play_pattern_timed [69,67],[$q], attack: $qs
  end

  #b14 and 15 start LEFT HAND
  play_pattern_timed [50,60,58,57,55,53,52,48,50,52,53,55],[$s], attack: $ss
  sleep $cr

  in_thread do #b16 RIGHT HAND
    use_synth $synR
    play_pattern_timed [72,70,69,67,65,64],[$s], attack: $ss
  end

  #b16 start LEFT HAND
  play_pattern_timed [45,55,53,52,50,48],[$s], attack: $ss
  sleep $cr

  in_thread do #b17 RIGHT HAND
    use_synth $synR
    play_pattern_timed [65,67],[$s], attack: $ss
    play_pattern_timed [67],[($q +$s)], attack: ($qs+$ss)
    play_pattern_timed [65],[$s], attack: $ss
  end

  #b17 start LEFT HAND
  play_pattern_timed [50.46],[$s], attack: $ss
  play_pattern_timed [48,36],[$q], attack: $qs
  sleep $cr

  in_thread do #b18 RIGHT HAND
    use_synth $synR
    play_pattern_timed [65,72,72],[$q], attack: $qs
  end

  #b18 start LEFT HAND
  play_pattern_timed [41,43,45,46,48,50],[$s], attack: $ss
  sleep $cr

  in_thread do #b19 RIGHT HAND
    use_synth $synR
    #play_pattern_timed [72,74,72,74,72,74,72,74,72,74,72,74],[$d], attack: $ds
    #alternative trill throughout
    play_pattern_timed [72,74],[$d], attack: $ds
    play_pattern_timed [72],[($s + 2 * $q)], attack: ($s + 2 * $q)
  end

  #b19 start LEFT HAND
  play_pattern_timed [40,50,48,46,45,43],[$s], attack: $ss
  sleep $cr

  in_thread do #b20 RIGHT HAND
    use_synth $synR
    play_pattern_timed [72],[(3 * $q)], attack: (3 * $q)
  end

  #b20 start LEFT HAND
  play_pattern_timed [45,46,48,50,52,53],[$s], attack: $ss
  sleep $cr

  in_thread do #b21 RIGHT HAND
    use_synth $synR
    play_pattern_timed [72],[(3 * $q)], attack: (3 * $q)
  end

  #b21 start LEFT HAND
  play_pattern_timed [43,53,52,50,48],[$s], attack: $ss
  sleep $cr

  in_thread do #b22 RIGHT HAND
    use_synth $synR
    play_pattern_timed [72,70,69,67,65,64],[$s], attack: $ss
  end

  #b22 start LEFT HAND
  play_pattern_timed [45,46,48,45,46,48],[$s], attack: $ss
  sleep $cr

  in_thread do #b23 RIGHT HAND
    use_synth $synR
    play_pattern_timed [72,62,64,66,67,69],[$s], attack: $ss
  end

  #b23 start LEFT HAND
  play_pattern_timed [42],[$q], attack: $qs
  sleep $c
  sleep $cr

  in_thread do #b24 RIGHT HAND
    use_synth $synR
    play_pattern_timed [70,69,67,65,64,62],[$s], attack: $ss
  end

  #b24 start LEFT HAND
  play_pattern_timed [43,45,46,43,45,46],[$s], attack: $ss
  sleep $cr

  in_thread do #b25 RIGHT HAND
    use_synth $synR
    play_pattern_timed [70,60,62,64,65,67],[$s], attack: $ss
  end

  #b25 start LEFT HAND
  play_pattern_timed [40],[$q], attack: $qs
  sleep $c
  sleep $cr

  in_thread do #b26 RIGHT HAND
    use_synth $synR
    play_pattern_timed [69,71,72,74,76,77],[$s], attack: $ss
  end


  #b26 start LEFT HAND
  play_pattern_timed [41,53,50],[$q], attack: $qs
  sleep $cr

  in_thread do #b27 RIGHT HAND
    use_synth $synR
    play_pattern_timed [68,77,76,74,72,71],[$s], attack: $ss
  end

  #b27 start LEFT HAND
  play_pattern_timed [47,44,40],[$q], attack: $qs
  sleep $cr

  in_thread do #b28 RIGHT HAND
    use_synth $synR
    play_pattern_timed [72,71,74,72,71,69],[$s], attack: $ss
  end

  #b28 start LEFT HAND
  play_pattern_timed [45,44,45,47,48,50],[$s], attack: $ss
  sleep $cr

  in_thread do #b29 RIGHT HAND
    use_synth $synR
    play_pattern_timed [68,69,68,66,64,62],[$s], attack: $ss
  end

  #b29 start LEFT HAND
  play_pattern_timed [52,53],[$d], attack: $d
  play_pattern_timed [52],[($s + 2 * $q)], attack: ($s + 2 * $q)
    #play_pattern_timed [52,53,52,53,52,53,52,53,52,53,52,53],[$d], attack: $d
  sleep $cr

  in_thread do #b30 RIGHT HAND
    use_synth $synR
    play_pattern_timed [60,62,64,66,68,69],[$s], attack: $ss
  end

  #b30 start LEFT HAND
  play_pattern_timed [52],[(3 * $q)], attack: (3 * $q)
  sleep $cr

  in_thread do #b31 RIGHT HAND
    use_synth $synR
    play_pattern_timed [62,72,71,69,68,66],[$s], attack: $ss
  end

  #b31 start LEFT HAND
  play_pattern_timed [52],[(3 * $q)], attack: (3 * $q)
  sleep $cr

  in_thread do #b32 RIGHT HAND
    use_synth $synR
    play_pattern_timed [64,66,68,69,71,72],[$s], attack: $ss
  end

  #b32 start LEFT HAND
  play_pattern_timed [52],[(3 * $q)], attack: (3 * $q)
  sleep $cr

  in_thread do #b33 RIGHT HAND
    use_synth $synR
    play_pattern_timed [66,76,74,72,71,69],[$s], attack: $ss
  end

  #b33 start LEFT HAND
  play_pattern_timed [52],[(3 * $q)], attack: (3 * $q)
  sleep $cr


  in_thread do #b34 RIGHT HAND
    use_synth $synR
    play_pattern_timed [68,69,68,66,64,62],[$s], attack: $ss
  end

  #b34 start LEFT HAND
  play_pattern_timed [52,64,62],[$q], attack: $qs
  sleep $cr

  in_thread do #b35 RIGHT HAND
    use_synth $synR
    play_pattern_timed [69,77,76,74,72,71],[$s], attack: $ss
  end

  #b35 start LEFT HAND
  play_pattern_timed [60,59,57],[$q], attack: $qs
  sleep $cr

  in_thread do #b36 + b37 RIGHT HAND
    use_synth $synR
    play_pattern_timed [81,80,78,76],[$s], attack: $ss
    play_pattern_timed [81],[($q + $s)], attack: ($qs + $ss)
    play_pattern_timed [74],[$s], attack: $ss
    play_pattern_timed [71],[($q + $s)], attack: ($qs + $ss)
    play_pattern_timed [69],[$s], attack: $ss
  end

  #b36 + b37 start LEFT HAND
  play_pattern_timed [62,64,65,62,64,52],[$q], attack: $qs
  sleep $cr

  in_thread do #b38 RIGHT HAND
    use_synth $synR
    play_pattern_timed [69],[($q + $s)], attack: ($qs + $ss)
    play_pattern_timed [69,70,72],[$s], attack: $ss
  end

  #b38 start LEFT HAND
  play_pattern_timed [57,45,46,48,50,51],[$s], attack: $ss
  sleep $cr

  in_thread do #b39 RIGHT HAND
    use_synth $synR
    play_pattern_timed [62,66,69],[$q], attack: $qs
  end

  #b39 start LEFT HAND
  play_pattern_timed [42,51,50,48,46,45],[$s], attack: $ss
  sleep $cr

  in_thread do #b40 RIGHT HAND
    use_synth $synR
    play_pattern_timed [70,67,69,70,72,74],[$s], attack: $ss
  end

  #b40 start LEFT HAND
  play_pattern_timed [43],[($q + $s)], attack: ($qs + $ss)
  play_pattern_timed [43,45,46],[$s], attack: $ss
  sleep $cr

  in_thread do #b41 RIGHT HAND
    use_synth $synR
    play_pattern_timed [64,74,72,70,69,67],[$s], attack: $ss
  end

  #b41 start LEFT HAND
  play_pattern_timed [36,43,48],[$q], attack: $qs
  sleep $cr

  in_thread do #b42 RIGHT HAND
    use_synth $synR
    play_pattern_timed [69],[$q], attack: $qs
    play_pattern_timed [77,76],[$s], attack: $ss
    play_pattern_timed [77],[$q], attack: $qs
  end

  #b42 start LEFT HAND
  play_pattern_timed [53,55,57,59,61,62],[$s], attack: $ss
  sleep $cr

  in_thread do #b43 RIGHT HAND
    use_synth $synR
    play_pattern_timed [67,76],[$q], attack: $qs
    sleep $q
  end

  #b43 start LEFT HAND
  play_pattern_timed [52,62,61,59,57,55],[$s], attack: $ss
  sleep $cr

  in_thread do #b44 RIGHT HAND
    use_synth $synR
    play_pattern_timed [74,76,77,79,81,82],[$s], attack: $ss
  end

  #b44 start LEFT HAND
  play_pattern_timed [53,57,62],[$q], attack: $qs
  sleep $cr

  in_thread do #b45 RIGHT HAND
    use_synth $synR
    play_pattern_timed [73,82,81,79,77,76],[$s], attack: $ss
  end

  #b45 start LEFT HAND
  play_pattern_timed [52,55,61],[$q], attack: $qs
  sleep $cr

  in_thread do #b46-b47 RIGHT HAND
    use_synth $synR
    play_pattern_timed [77,74],[$q], attack: $qs
    play_pattern_timed [67],[($q + $s)], attack: ($qs + $ss)
    play_pattern_timed [74,73,76,69,73],[$s], attack: $ss
  end

  #b46-b47 start LEFT HAND
  play_pattern_timed [50,52,53,55,57,58,49,58,57,55,53,52],[$s], attack: $ss
  sleep $cr

  in_thread do #b48 RIGHT HAND
    use_synth $synR
    play_pattern_timed [74,71],[$s], attack: $ss
    play_pattern_timed [73],[($q + $s)], attack: ($qs + $ss)
    play_pattern_timed [74],[$s], attack: $ss
  end

  #b48 start LEFT HAND
  play_pattern_timed [53,55],[$s], attack: $ss
  play_pattern_timed [57,45],[$q], attack: $qs
  sleep $cr

  in_thread do #b49 RIGHT HAND
    use_synth $synR
    play_pattern_timed [74,72,70,69,67,65],[$s], attack: $ss
  end

  #b49 start LEFT HAND
  play_pattern_timed [46],[($q + $s)], attack: ($qs + $ss)
  play_pattern_timed [48,46,45],[$s], attack: $ss
  sleep $cr

  in_thread do #b50 RIGHT HAND
    use_synth $synR
    play_pattern_timed [70,61,62,64,65,67],[$s], attack: $ss
  end

  #b50 start LEFT HAND
  play_pattern_timed [43,58,57,55,53,52],[$s], attack: $ss
  sleep $cr

  in_thread do #b51 RIGHT HAND
    use_synth $synR
    play_pattern_timed [69,74],[$s], attack: $ss
    play_pattern_timed [65],[$q], attack: $qs
    play_pattern_timed [64,62],[$s], attack: $ss
  end

  #b51 start LEFT HAND
  play_pattern_timed [53,55],[$s], attack: $ss
  play_pattern_timed [57,45],[$q], attack: $qs
  sleep $cr

  in_thread do #b52 RIGHT HAND
    use_synth $synR
    play_pattern_timed [62],[(3 * $q)], attack: (3 * $q) #full length
  end

  #b52 start LEFT HAND
  play_pattern_timed [38],[(3 * $q)], attack: (3 * $q) #full length

  sleep (3 * $q) #bar before next tune

end #of tune definition

########Play tune several times with different settings#######
#slow different synth each hand
$m = 1.4  #multiplier for timing
$c = 0.5 * $m #crotchet ALWAYS THIS VALUE
$q = 0.25 * $m #quaver ALWAYS THIS VALUE
$s = 0.125 * $m #semi-quaver ALWAYS THIS VALUE
$d = 0.0625 * $m #demi-semi-quaver ALWAYS THIS VALUE 
$qs = 0.15 * $m #staccato quaver attack < or = to $q
$ss = 0.125 * $m #staccato semi attack < or = to$s
$ds = 0.0625 * $m #staccato demi-semi attack < or = to $d
$cr = 0.018125 * $m #sync correction...value by trial and error
$synR =  :beep #set synth as a global named variable for RIGHT hand. Allows single point changing
$synL = :saw_beep #set synth as a global named variable for LEFT hand.
#play tune
tune

#bit faster, same synth both hands
$m = 1.3  #multiplier for timing
$c = 0.5 * $m #crotchet ALWAYS THIS VALUE
$q = 0.25 * $m #quaver ALWAYS THIS VALUE
$s = 0.125 * $m #semi-quaver ALWAYS THIS VALUE
$d = 0.0625 * $m #demi-semi-quaver ALWAYS THIS VALUE 
$qs = 0.2 * $m #staccato quaver attack < or = to $q
$ss = 0.125 * $m #staccato semi attack < or = to$s
$ds = 0.0625 * $m #staccato demi-semi attack < or = to $d
$cr = 0.018125 * $m #sync correction...value by trial and error
$synR = :saw_beep #set synth as a global named variable for RIGHT hand. Allows single point changing
$synL = :saw_beep #set synth as a global named variable for LEFT hand.
#play tune
tune

#moderate temop, differnt synths each hand
$m = 1.2  #multiplier for timing
$c = 0.5 * $m #crotchet ALWAYS THIS VALUE
$q = 0.25 * $m #quaver ALWAYS THIS VALUE
$s = 0.125 * $m #semi-quaver ALWAYS THIS VALUE
$d = 0.0625 * $m #demi-semi-quaver ALWAYS THIS VALUE 
$qs = 0.125 * $m #staccato quaver attack < or = to $q
$ss = 0.125 * $m #staccato semi attack < or = to$s
$ds = 0.0625 * $m #staccato demi-semi attack < or = to $d
$cr = 0.018125 * $m #sync correction...value by trial and error
$synR =  :beep #set synth as a global named variable for RIGHT hand. Allows single point changing
$synL = :saw_beep #set synth as a global named variable for LEFT hand.
#play tune
tune

#fast same synth each hand
$m = 1.0  #multiplier for timing
$c = 0.5 * $m #crotchet ALWAYS THIS VALUE
$q = 0.25 * $m #quaver ALWAYS THIS VALUE
$s = 0.125 * $m #semi-quaver ALWAYS THIS VALUE
$d = 0.0625 * $m #demi-semi-quaver ALWAYS THIS VALUE 
$qs = 0.125 * $m #staccato quaver attack < or = to $q
$ss = 0.120 * $m #staccato semi attack < or = to$s
$ds = 0.0625 * $m #staccato demi-semi attack < or = to $d
$cr = 0.018125 * $m #sync correction...value by trial and error
$synR = :saw_beep #set synth as a global named variable for RIGHT hand. Allows single point changing
$synL = :saw_beep #set synth as a global named variable for LEFT hand.
#play tune
tune

#super fast. different synth each hand
$m = 0.8 #multiplier for timing
$c = 0.5 * $m #crotchet ALWAYS THIS VALUE
$q = 0.25 * $m #quaver ALWAYS THIS VALUE
$s = 0.125 * $m #semi-quaver ALWAYS THIS VALUE
$d = 0.0625 * $m #demi-semi-quaver ALWAYS THIS VALUE 
$qs = 0.125 * $m #staccato quaver attack < or = to $q
$ss = 0.120 * $m #staccato semi attack < or = to$s
$ds = 0.0625 * $m #staccato demi-semi attack < or = to $d
$cr = 0.018125 * $m #sync correction...value by trial and error
$synR = :beep #set synth as a global named variable for RIGHT hand. Allows single point changing
$synL = :saw_beep #set synth as a global named variable for LEFT hand.
#play tune
tune


