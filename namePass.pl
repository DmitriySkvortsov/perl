#!/usr/bin/perl
use warnings;
use strict;
#
# -------------------------------------------
# variables

chomp ( my $enter_name = <STDIN> );
chomp ( my $enter_pass = <STDIN> );


my $user_name = {
    Ivan     => 'qwerty'   ,
    Andrew   => 'qazwsx'   ,
    Alex     => 'password' ,
    Dim      => '123123'   ,
    Anton    => 'qwe123'   ,
    Juriy    => 'jur0102'  ,
    Alexandr => 'nevskiy'  ,
    Nikolaj  => 'pervyi'   ,
    Max      => 'mimino'   ,
    Sergey   => 'qwsazx'
};

#
# -------------------------------------------
# main

if ( exists $user_name->{$enter_name} )
{
    if ( $enter_pass eq $user_name->{$enter_name} ){
        print "Hi $enter_name your pass $user_name->{$enter_name}\n";
    }else{
        print "Wrong password\n";
    }
}else
{
    print "Who are you $enter_name\n";
}