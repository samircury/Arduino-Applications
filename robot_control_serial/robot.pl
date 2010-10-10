#!/usr/bin/perl
use strict;
use warnings;
use Device::SerialPort;
use Term::ReadKey;

my $sp =  Device::SerialPort->new("/dev/ttyUSB0");

$sp->databits(8);
$sp->baudrate(9600);
$sp->stopbits(1);
$sp->parity("none");

#$sp->write(s);

ReadMode 'cbreak';
my $input = ReadKey(0);


sub kill_me {
	ReadMode 'normal';
	die "Voce saiu do controle com q";

}


while (1) {
	my $input = ReadKey(0);

	kill_me() if $input eq "q";

	$sp->write($input);
	print $input, $/;
	if ( $input eq "w" ) {
 		$sp->write("w");
	}
	if ( $input eq "s" ) {
 		$sp->write("s");
	}


}

#    print "\033[2J";

