#!/usr/bin/perl
use warnings;
use strict;


my $p_name = $ENV{'USER_NAME'};
my $p_pass = $ENV{'PASS'};
my $o_res = -1;



if( $p_name ){
    if( $p_pass ){
        $o_res = &_login( $p_name,$p_pass );        
    }else{
        print "Enter password\n";
    }
}else{
    print "Enter login\n";
}



print "o_res $o_res\n";



sub _login{
    chomp ( my ( $v_name,$v_pass ) = @_) ;
    my $v_res = -1;
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

    if ( exists $user_name->{$v_name} )
    {
        if ( $v_pass eq $user_name->{$v_name} ){            
            $v_res = 0;
            return $v_res;
        }
    }
    return $v_res;
}

