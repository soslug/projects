#strange noises by Robin Newman 9th October 2013
#This piece illustrates the use of the fm synth, using a variable in a loop
#to select note pitches, and use of the reverse and shuffle parameters for a play_pattern
#the piece is enclosed in a repeat do...end loop which runs continuously
#until the stop button is pushed

repeat do #runs until you press stop
play_synth "fm","note",172,"divisor",85,"release",5
sleep 2
n=40
10.times do
play n
sleep 0.2
n = n * 1.1
end
stop
play_synth "fm" ,"note",120,"divisor",200,"release",2
sleep 2
play_synth "fm" ,"note",70,"divisor",100,"release",1
sleep 2

play_synth "fm" ,"note",100,"divisor",333,"release",10
sleep 2
2.times do
with_synth "saw_beep"
with_tempo 900
play_pattern [60,61,62,63,64,65,66,67,68,69,70,71],"attack",0.2
play_pattern [60,61,62,63,64,65,66,67,68,69,70,71].reverse,"attack",0.2
end
3.times do
play_pattern [60,61,62,63,64,65,66,67,68,69,70,71].shuffle,"attack",0.2
end
n=60
20.times do
play n
sleep 0.2
n = n + 2
end
play_synth "fm","note",155,"divisor",15,"release",5
sleep 2
end
