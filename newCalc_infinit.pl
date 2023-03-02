#!/usr/bin/perl

use warnings;
use strict;
# Программа калькулятор предназначена для сложения, вычитания, деления, умножения 
# целых и деситичных чисел.Предпологается не ограниченое число операций.
#  Программа работает в консольном режиме и предполагает интерактивное взаимодействие с пользователем
# режим ввода следующий ( цифра , знак операции, цифра)
# или польская запись
# Для выхода из программы используется символ равно
# по завершении программы в консоль будет выведен результат

# ---------------------------------------------------------------------------------
# variables

my $calc;
my @digit;
my $sign;
my $pod_itog;


#--------------------------------------------------------------------------------
# functions

sub _plus{
    my ( $a , $b ) = @_;                    
    return ( $a * 1 ) + ( $b * 1 );             
}


sub _minus{
    my ( $a , $b ) = @_;                    
    return ( $a * 1 ) - ( $b * 1 );              
}


sub _divide{
    my ( $a , $b ) = @_;
     if ( $b == 0 ){
        print "Cant divide by zero\n";
        return $a;
    }                   
    return ( $a * 1 ) / ( $b * 1 );             
}

sub _mlt{
    my ( $a , $b ) = @_;                   
    return ( $a*1 ) * ( $b*1 );              
}

sub _calculator{
    my $params = shift;
    my $a = $params->{a};
    my $b = $params->{b};
    my $itog;

    if ( $sign eq '+' ){
        $itog = _plus( $a , $b );
        print "$a + $b = $itog\n"; 
        $sign = '';
    }
    
    if ( $sign eq '-' ){
        $itog = _minus( $a , $b );
        print "$a - $b = $itog\n";
        $sign = '';                     
    }
    
    if ( $sign eq '/' ){
        $itog = _divide( $a , $b );
        if ( $b == 0 ){
        $itog = '';
        }
        print "$a / $b = $itog\n"; 
        $sign = '';                      
    }

    if ( $sign eq '*' ){
        $itog = _mlt( $a , $b );
        print "$a * $b = $itog\n"; 
        $sign = '';                      
    }        
    return $itog;
}

#--------------------------------------------------------------------------------
# main
print "Hello this is infit calculator, please enter numb or sign in line\n";
while( 1 )
{
    chomp ( my $compute = <STDIN> );
    $calc .= "$compute ";                            
    
    if ( $compute =~ m/^(\d){1,}$/x){
        push @digit, $compute;                       
    }elsif ( $compute =~ m/^([\+\-\/\*\=]){1,}$/x){
        $sign = $compute;                            
    }else {
        print "Wrong input\n";
        next;
    }

    if ( $compute eq "="){
        print "$calc $digit[0]\n";
        last;
    }

    # block compute
    my $size_arr = @digit;
    if ( $size_arr >= 2 && ($sign && length($sign) == 1 )){
        my $itogo = _calculator({
            a => $digit[0],
            b => $digit[1]
        });
        @digit = ();                                  
        push @digit, $itogo;
    }
    # checking non-standart situation
    if ( ($size_arr < 2) && ($sign && length($sign) == 1 ) ){
        print "enter numb\n";
    }
    if ( $size_arr <= 1 && ($sign && length($sign) < 1 )){
        print "enter sign or numb\n";
    }
    if ( $size_arr >= 3){
        print "better enter sign, your last numb deleted\n";
    }
    if ( $size_arr == 2 && ($sign && length($sign) < 1 )){
        print "enter sign\n";
    }
    
}