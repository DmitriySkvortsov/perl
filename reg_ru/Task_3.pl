#!/usr/bin/perl
use warnings;
use strict;


my $datetime = "2016-04-11 20:59:03";
my @datetime;
my $date;
my $time;
@datetime = split(" ",$datetime);
$date= $datetime[0];
$time = $datetime[1];
print "$date \n";
print "$time \n";
