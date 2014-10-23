#GoingBananasWithFMSynth by Robin Newman 19th October 2013

#This program explores the use of the FM Synth in Sonic-Pi (with three chords from saw_beep)

#The basic syntax to play a note is play_synth "fm","note",n,"divisor",d,"release",r
#followed by a sleep command for the note to sound, where n, d and r are numbers
#The program uses n.times do....end loops and variables to cycle through different notes and divisor settings
#in each case an in_thread do.....end is used to play a second sequence of notes at the same time
#NB in order to compute values for the divisor the calculation has to be enclosed in brackets. Thus (n / 4)

#Description of the piece
#The piece is symmetrical with six parts
#an intro of a soft warble and a buzzing note that rise then falls in intensity
#section 1: a pattern of a rising semitone scale over two octaves, played with a similar pattern
#offset by half a beat and falling for two octaves. The divisor settings for the two patterns are different.
#section two a pattern when a note is played with 5 different values for the divisor setting, then raised
#by three tones before being played again. Repeated 24 times
#This is played against the same pattern with the divisors in reverse order, and the notes falling by three tones
#between repetitions
#the symmetrical axis of the piece is a constant saw_beep chord which grows and fades over 8 seconds
#section 3 is a repeat of section 2, but with the order of the five notes for each divisor setting reversed
#section 4 is a repeat of section 1 with the divisor settings for the two patterns swapped over
#a final end sections repeats the two initial notes in reverse order.
#the divisor multipliers used are n/4 n/2 n n*2 and n*4 where n is the pitch of the note
#this will produce some numbers out of range, but the note will still play
#you can experiment with other settings eg n/1.5,n/1.2,n,n*1.2,n*1.5 (NB leave spaces as shown in the program)
#the timing settings can be altered with variables t and s, but as supplied the piece lasts 187.2 seconds
#the whole piece has a mathematical symmetry, although the resulting sounds seem more random


#===========Program starts below =================================
#set timings for first (t) and middle (s) sections
t = 0.8
s = 1
#=====intro section===============================================
play_synth "fm","note",36,"divisor",(12 ),"release",3 #quiet warble
sleep 3
with_synth "saw_beep"
#a buzzing note that rises then falls in intensity
play_chord [24,24.2],"attack",4,"release",4
sleep 8 #sleep time equals sum of attack and release times
#======section 1==================================================
p = 60 #starting pitch
#timings set by t
in_thread do
  pt = 84 #starting pitch for thread
  sleep (t / 2) #the notes are offset by half a "beat" 
  24.times do
    play_synth "fm","note",pt,"divisor",(pt * 2 ),"release",t
    sleep t
    pt = pt - 1 #notes fall in pitch by a semitone
  end 
end #end of thread
24.times do
  play_synth "fm","note",p,"divisor",(p / 4 ),"release",t
  sleep t
  p = p + 1 #notes rise in pitch by a semitone
end
sleep (t / 2) # allows for completion of the offset thread notes
#end of section 1=================================================
in_thread do #thread for section 2
  nt = 48 #starting pitch for thread
  #timings set by s
  12.times do
    #play the same note 5 times with different related divisor times
    play_synth "fm","note",nt,"divisor",(nt / 4),"release",s
    sleep s
    play_synth "fm","note",nt,"divisor",(nt / 2),"release",s
    sleep s
    play_synth "fm","note",nt,"divisor",nt ,"release",s
    sleep s
    play_synth "fm","note",nt,"divisor",(nt * 2),"release",s
    sleep s
    play_synth "fm","note",nt,"divisor",(nt * 4),"release",s
    sleep s
    nt = nt + 6 #increase pitch by 3 tones
  end
end #of thread for section 2
n = 120 #starting pitch
#timings set by s
12.times do
  #play the same note 5 times with different related divisor times
  #order of notes is reversed from that in the thread
  play_synth "fm","note",n,"divisor",(4 * n),"release",s
  sleep s
  play_synth "fm","note",n,"divisor",(2 * n),"release",s
  sleep s
  play_synth "fm","note",n,"divisor",n ,"release",s
  sleep s
  play_synth "fm","note",n,"divisor",(n / 2),"release",s
  sleep s
  play_synth "fm","note",n,"divisor",(n / 4),"release",s
  sleep s
  n = n - 6 #decrease pitch of the note by 3 tones
end
#end of section 2===============================================
#symmetric axis for the piece...a saw_beep chord
#marks the half way point of the piece
with_synth "saw_beep"
play_chord [72,72.2],"attack",6
sleep 6
#end of symmetric axis note=====================================
#section 3 repeats section 2 but with the order of the 5 notes reversed for each pitch played
in_thread do #section 3 thread start
  nt = 120  #starting pitch
  #timings set by s
  12.times do
    #play note five times
    play_synth "fm","note",nt,"divisor",(nt / 4),"release",s
    sleep s
    play_synth "fm","note",nt,"divisor",(nt / 2),"release",s
    sleep s
    play_synth "fm","note",nt,"divisor",nt ,"release",s
    sleep s
    play_synth "fm","note",nt,"divisor",(nt * 2),"release",s
    sleep s
    play_synth "fm","note",nt,"divisor",(nt * 4),"release",s
    sleep s
    nt = nt - 6 #pitch changes down three tones
  end
end #of thread section 3
n = 48
#timings set by s
12.times do
  play_synth "fm","note",n,"divisor",(n * 4),"release",s
  sleep s
  play_synth "fm","note",n,"divisor",(n * 2),"release",s
  sleep s
  play_synth "fm","note",n,"divisor",n ,"release",s
  sleep s
  play_synth "fm","note",n,"divisor",(n / 2),"release",s
  sleep s
  play_synth "fm","note",n,"divisor",(n / 4),"release",s
  sleep s
  n = n + 6 #pitch changes up by 3 tones
end
#end of section 3==============================================

#section 4 
p = 60 #starting pitch
#timings set by t
in_thread do
  sleep (t / 2) #offset by half a "beat"
  pt = 84 #thread starting pitch
  24.times do
    #divisor setting swapped from section 1 with the concurrent loop
    play_synth "fm","note",pt,"divisor",(pt / 4 ),"release",t
    sleep t
    pt = pt - 1 #pitch lowers a semitone
  end
end #end of thread for last section
24.times do
  play_synth "fm","note",p,"divisor",(p * 2 ),"release",t
  sleep t
  p = p + 1 #pitch rises a semitone
end 
sleep (t / 2)
#end of last section============================================
#finish section
with_synth "saw_beep"
play_chord [24,24.2],"attack",4,"release",4
sleep 8 
play_synth "fm","note",48,"divisor",(12 ),"release",3
sleep 3
#end of piece===================================================
