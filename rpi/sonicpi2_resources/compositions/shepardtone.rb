e_synth :prophet
use_synth_defaults sustain: 0.2, release: 1, attack_level: 0.5
in_thread do
  loop do
    play 60, amp: 0.1
    sleep 1
    play 61, amp: 0.18
    sleep 1
    play 62, amp: 0.26
    sleep 1
    play 63, amp: 0.34
    sleep 1
    play 64, amp: 0.42
    sleep 1
    play 65, amp: 0.50
    sleep 1
    play 66, amp: 0.58
    sleep 1
    play 67, amp: 0.66
    sleep 1
    play 68, amp: 0.74
    sleep 1
    play 69, amp: 0.82
    sleep 1
    play 70, amp: 0.90
    sleep 1
    play 71, amp: 1
    sleep 1
  end
end

in_thread do
  loop do
    play 72, amp: 1
    sleep 1
    play 73, amp: 0.90
    sleep 1
    play 74, amp: 0.82
    sleep 1
    play 75, amp: 0.74
    sleep 1
    play 76, amp: 0.66
    sleep 1
    play 77, amp: 0.58
    sleep 1
    play 78, amp: 0.50
    sleep 1
    play 79, amp: 0.42
    sleep 1
    play 80, amp: 0.34
    sleep 1
    play 81, amp: 0.26
    sleep 1
    play 82, amp: 0.18
    sleep 1
    play 83, amp: 0.1
    sleep 1
  end
end
