set ns [new Simulator]
set tf [open cn.tr w]
$ns trace-all $tf
set nf [open cn.nam w]
$ns namtrace-all $nf

proc finish { } {
global ns tf nf
$ns flush-trace
close $tf
close $nf
exec nam cn.nam &
exit 0
}

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]

$ns duplex-link $n0 $n1 60Mb 1ns DropTail
$ns duplex-link $n1 $n2 4Mb 2ns DropTail

$ns queue-limit $n1 $n2 9

set tcp [new Agent/TCP]
$ns attach-agent $n0 $tcp
set ftp [new Application/FTP]
$ftp attach-agent $tcp

set tcpsink [new Agent/TCPSink]
$ns attach-agent $n2 $tcpsink
$ns connect $tcp $tcpsink

$ns at 1.0 "$ftp start"
$ns at 3.0 "$ftp stop"
$ns at 3.5 "finish"
$ns run 
