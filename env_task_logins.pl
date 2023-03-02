#!/usr/bin/perl
use warnings;
use strict;
use Data::Dumper;
use Env;
use lib "$ENV{HOME}/Test_perl/learning_perl";
use TOOLS;

my $user_name = $ENV{'user_name'};
my $user_pass = $ENV{'pass'};
my $action = $ENV{'action'};

if ( $action =~ m/^(\w+)$/x && $action eq 'log' ) {
    my $v_res = &TOOLS::login( $user_name, $user_pass );
    if ( $v_res > 0 ) {
        print "Hello my dear friend\n";
    } elsif ( $v_res == 0 ) {
        print "We don`t know who are you, next time try to reg\n";  # нет такого логина пусть идет в рег
    } else {
        print "Wrong password, bye\n"; # только для тех кто вводит пароль с 1 раза
    }
    exit;
} elsif ( $action =~ m/^(\w+)$/x && $action eq 'reg' ) {       
    my $reg = TOOLS::reg_user( $user_name, $user_pass ); 
} elsif ( $action =~ m/^(\w+)$/x && $action eq 'del' ) {
    my $del = TOOLS::del_user( $user_name, $user_pass );
} elsif ( $action =~ m/^(\w+)$/x && $action eq 'change' ) {
    my $chng_pass = TOOLS::change_pass( $user_name, $user_pass );
} else {
    print "Use reg if you want registration new user\n
            Use log if you want loging in\n
            Use del if you want to delete you account\n
            Use change if you want change password\n ";
    exit;
}
