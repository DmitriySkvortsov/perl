#!/usr/bin/perl
use warnings;
use strict;

# --------------------------------------------------------
# variables
#

my $user_name = $ENV{'USER_NAME'};
my $user_pass = $ENV{'PASS'};
#print "$user_name => $user_pass\n";


# --------------------------------------------------------
# functions
#

sub _searchname
{	   
    my $shift_name = shift;
    my @names = ( 'Ivan', 'Andrew', 'Alex', 'Dim', 'Anton', 'Juriy', 'Alexandr', 'Nikolaj', 'Max', 'Sergey' );
    my $ret = 0;
    foreach my $name( @names )
    {
	    if ( $name eq $shift_name )
	    { 	
	        $ret = 1;
            last;
	    }
    }
    return $ret;
}

# --------------------------------------------------------
# main
#

if ( _searchname( $user_name ) )
{                  
    print "Hello $user_name you pass $user_pass\n";        
}else
{                             
    print "Who are you $user_name ?";  
}

