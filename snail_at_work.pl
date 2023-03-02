#!/usr/bin/perl
use warnings;
use strict;
use POSIX;

print "Please enter only numbers\n";
print "How many tasks snail have now\n";
chomp ( my $snail_aim = <STDIN> );

print "How many tasks snail can solve on one day\n";
chomp ( my $snail_solve = ( <STDIN> * 10 ) );

print "How many tasks add per day\n";
chomp ( my $tasks_add = ( <STDIN> * 10 ) );

my $result = ( ($snail_solve - $tasks_add) > 0 ) ? ( $snail_aim / ($snail_solve - $tasks_add) ) : 0 ;
my $a = $result > 0;
$result = ceil($result);

my $answer = $a ? "Can solve $result sprint\n" : "Can`t solve\n";
print "$answer\n";
