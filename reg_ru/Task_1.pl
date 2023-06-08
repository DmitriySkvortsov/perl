#!/usr/bin/perl
use warnings;
use strict;


my @unsorted = ( qw/ 7 1 3 4 2 4 6 5 5 / );
my @out;
my $enter_cnt = @unsorted;

#-------------------------------------------------
#Bubble Sort

print "unsorted \n";
print "@unsorted\n";


while( $enter_cnt )
{
    for ( my $i = 0 ; $i <= $enter_cnt -2; $i++ )
    {
        if ( $unsorted[ $i ] > $unsorted[ $i+1 ] )
        {
            ( $unsorted[ $i ], $unsorted[ $i+1 ] ) = ( $unsorted[ $i+1 ], $unsorted[ $i ] ); 
        }    
    } 
    @out = @unsorted;
    $enter_cnt--;
}

print "After bubble sort\n";
print "@out\n";

#---------------------------------------------------------
#Binary Search

print "Enter numb to search \n";
chomp (my $enter_to_search = <STDIN>);
my ( $high, $f_key, $mid );
my $key = 0 ;
my $low = 0 ;
$high = $#out;

while( ( $low <= $high ) && !$f_key )
{
    $mid = ( $low + $high ) / 2;
    if( $enter_to_search == $out[$mid] ) {
        $f_key = 1;
        $high = int( $mid );
    } elsif ( $enter_to_search < $out[$mid] ) {
        $high = $mid - 1;
    } else {
        $low = $mid + 1;
    }
}

if( $f_key ) {
    print "Match\n";
} else {
    print "Not matched\n";
}
