#!/usr/bin/perl
use warnings;
use strict;

my @ent_numb =( 1 , 5 , 7 , 9 , 3 , 4 , 2 ,44 , 32 , -1 , -121 , -12 );
my @out;
my $enter_cnt = @ent_numb;

print "enter some numbers \n";
print "@ent_numb\n";


while( $enter_cnt )
{
    for ( my $i = 0 ; $i <= $enter_cnt -2; $i++ )
    {
        if ( $ent_numb[ $i ] > $ent_numb[ $i+1 ] )
        {
            ( $ent_numb[ $i ], $ent_numb[ $i+1 ] ) = ( $ent_numb[ $i+1 ], $ent_numb[ $i ] ); 
        }    
    } 
    @out = @ent_numb;
    $enter_cnt--;
}

print "After bubble sort\n";
print "@out\n";