#!/usr/bin/perl
use warnings;
use strict;

my $path_to_f ="$ENV{HOME}/Git_lab_reps/perl-1/conf.ini";

sub _read_conf{
    open my $CONFIG, "<", $path_to_f or die "Not found file\n";
    my @conf_path = <$CONFIG>;
    close $CONFIG;
    return @conf_path;
}


