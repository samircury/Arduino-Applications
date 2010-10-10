#!/usr/bin/perl
use Device::SerialPort;

$sp=new Device::SerialPort("/dev/ttyUSB0");

$sp->databits(8);
$sp->baudrate(9600);
$sp->stopbits(1);
$sp->parity("none");


while (1) {

 $var = $sp->read();

print $var;

}

