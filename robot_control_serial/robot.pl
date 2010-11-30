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

ReadMode 'cbreak'; # com isso a leitura do terminal é de caracter por caracter, assim que eles são pressionados, diferente da leitura normal, que é linha a alinha
my $input = ReadKey(0); 


sub kill_me {
	ReadMode 'normal';
	die "Voce saiu do controle com q";

}


while (1) {
	my $input = ReadKey(0);

	kill_me() if $input eq "q";

	$sp->write($input); # Manda o char que for para o Arduino

	print $input, $/; # Imprime na tela só para você ver o que está fazendo.
}


