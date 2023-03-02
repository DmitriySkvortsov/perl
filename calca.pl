#!/usr/bin/perl
use warnings;
use strict;


my ( $numb1, $numb2, $int_sign ) = (@ARGV);
my @sign = ( "plus" , "minus" , "mlt" , "divide" );
my @errors;



if ( defined $numb1 ){
    if ( $numb1 =~ m/(\D)/ )
    {
        push @errors, 'numb1 not numeric';
    }
    
}else{
     push @errors, 'first numeric not good';     
}

if ( defined $numb2 ){
    if ( $numb2 =~ m/(\D)/ )
    {
        push @errors,  'numb2 not numeric';        
    }
   
}else{
    push @errors,  'second numeric not good';    
}

if (not defined $int_sign ){
    push @errors,  'is not math sign';    
}

for my $error ( @errors ){ 
    print "$error\n";
}
if ( @errors ){
    exit;
}


if ( $int_sign eq 'plus' ){
    print "$numb1 + $numb2 = ","$numb1" + "$numb2"        ;
}
elsif ( $int_sign eq 'minus' ){
    print "$numb1 - $numb2 = ","$numb1" - "$numb2"        ;
}
elsif ( $int_sign eq 'mlt' ){
    print "$numb1 * $numb2 = ","$numb1" * "$numb2"        ;
}
elsif ( $int_sign eq 'divide' ){
    if ( $numb2 != 0 )
    {
        print "$numb1 / $numb2 = ","$numb1" / "$numb2"    ;
    }else{
       print "Brahmagupta turned over in his coffin, cant divide zero";
    }
}else{
    print "Try again and enter math sign last";
}
