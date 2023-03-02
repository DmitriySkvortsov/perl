#!/usr/bin/perl
use warnings;
use strict;


my @name = ("Ivan", "Andrew", "Alex", "Dim", "Anton", "Juriy", "Alexandr", "Nikolaj", "Max", "Sergey");
my $searchname = 0;

	print ("Enter name\n");
	$a = <STDIN>;
	chomp ($a) ;
&searchname;


sub searchname {
	
foreach my $names (@name){
	
	if ($a eq $names){
	$searchname = 1;
	last;
	}
}



if ($searchname eq 1){
print "Hello $a\n";
}else{
print "Who are you $a?";

}}