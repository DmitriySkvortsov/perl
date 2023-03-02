#!/usr/bin/perl
use warnings;
use strict;

my %numbers;
my $quant_numb;
my $questions;
my $answer;
my $good_answer = 0;
my $bad_answer = 0;
my $random;
my $random_num;
my $random_num2;
my @numbers_arr;



print " Hello, you need to put more then 6 numbers to test your memory\n";

while(1){
    print "Enter number or point\n";
    chomp( my $e_numb = <STDIN> );

    if ( $e_numb =~ m/^(\d)$/x && $e_numb ){
        #print "$numbers{$e_numb}\n";
        if ( exists $numbers{$e_numb} ){
            print "This mumber already have, put new one\n";
        } else {
            $numbers{$e_numb}  = 1 ;
            push @numbers_arr, $e_numb;
        }        
        redo; 
    }elsif ( $e_numb =~ m/^(\.)$/x  ){
        $quant_numb = keys %numbers;
        
    }else{
        print "Enter number or point\n";
        redo;
    }
    print "$numbers{$e_numb}\n";
    last;
}

system("clear");

if( $quant_numb < 6 ){
    $questions = 0;
    print "Not enough numbers for test.\n";
    exit;
}elsif( $quant_numb <= 7 ){
    $questions = 3;
}elsif( $quant_numb <= 11 ){
    $questions = 4;
}elsif( $quant_numb > 11 ){
    $questions = 5;
}else{
    print "something wrong\n";
    exit;
}

while ( $questions ){
    
    $random = int rand ( $quant_numb );

    if ( $random == 0 ){
        $random +=1;
    }

    $random_num = ( $numbers_arr[$random] );
        print "What number was before $random_num ? \n Put number and push enter\n";
    
    $random_num2 = ( $numbers_arr[ $random-1 ] );
    chomp( $answer = <STDIN> );
    if ( $answer =~ /\d/ ){
        if ( $answer == $random_num2 ){
            $good_answer += 1;
            $questions -=1;
        } else {
            $bad_answer += 1;
            $questions -=1;
        }
    } else {
        print "Enter numbers \n";
    }
    next;
}

if ( $good_answer > $bad_answer ){
    print "Your memory is good\n";
} else {
    print "You need take a pill for your memory\n";
}
exit;
