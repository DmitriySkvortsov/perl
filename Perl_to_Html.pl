#!/usr/bin/perl
use warnings;
use strict;
use CGI;
use DBI;
use DBD::mysql;

# ------------------------------------------------------
# connect

my $login = "login here";                             # В данном случае пара логин пароль указаны жестко, но помним что 
my $password = "passsword here";                                # всегда есть возможность принимать как входящий параметр 

my $dbh = DBI->connect( "dbi:mysql:test_database", $login, $password ) or die "Can`t connect to DB\n";

# ------------------------------------------------------
# main

my $sth;
my $home = "$ENV{HOME}/your rep here/";
my $maillog_path = "$home" ."log/mail.log";
my $create_table_message = &_create_table_message();
my $create_table_log = &_create_table_log();
my @maillog = &_take_log();
my $tables;
my $writing;

foreach my $line ( @maillog ) {
    my ( $str, $date, $time, $id, $flag, $address, $info ) = split " ", $line;
    
    if ( $flag eq "<=" ) {

        my $write = &_input_to_table_mas( $date, $time, $id, $str );

    } elsif ( $flag eq "<=" || $flag eq "=>" || $flag eq "**" || $flag eq "==" || $flag eq "." ) {  # Можно конечно регуляркой 

            my $write = &_input_to_table_log( $date, $time, $id, $str, $address );

    } else {
        # print eror in html ;
        # log error;
    }
}


my $enter_address = shift;

my $take_from_tables = &_take_from_tables($enter_address);

#print $take_from_tables;
#my $print_table = &_output_to_html($take_from_tables);


# -----------------------------------------------------
# subs

sub _create_table_message {
    $sth = $dbh->prepare( "
                            CREATE TABLE message (
                                created TIMESTAMP(0) NOT NULL,
                                id INT NOT NULL AUTO_INCREMENT,
                                int_id CHAR(16) NOT NULL,
                                str VARCHAR(45) NOT NULL,
                                status TINYINT(1),
                                PRIMARY KEY(id),
                                UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE
                            );
                        ");
$sth->execute();
    
}

sub _create_table_log {
    $sth = $dbh->prepare( "
                            CREATE TABLE log (
                                created TIMESTAMP(0) NOT NULL,
                                int_id CHAR(16) NOT NULL,
                                str VARCHAR(45),
                                address VARCHAR(45)
                            );
                        ");
$sth->execute();
    
}

sub _take_log {
    open my $MAILLOG, "<" , $maillog_path or die "Can`t find file in $maillog_path\n";
    @maillog = <$MAILLOG>;
    close
    return @maillog;
}

sub _input_to_table_mas {
    my $date = shift;
    my $time = shift;
    my $id = shift;
    my $str = shift;
    $date = $date ." $time";

    $sth = $dbh->prepare( "
                            INSERT INTO message(created, int_id, str, status)
                            VALUES ( ?, ?, ?, '1' )
                        ");
    $writing = $sth->execute( $date, $id, $str );
}

sub _input_to_table_log {
    my $date = shift;
    my $time = shift;
    my $id = shift;
    my $str = shift;
    my $address = shift;
    $date = $date ." $time";

    $sth = $dbh->prepare( "
                            INSERT INTO log(created, int_id, str, address)
                            VALUES ( ?, ?, ?, ? )
                        ");
    $writing = $sth->execute( $date, $id, $str, $address );
}

sub _take_from_tables {
    my $input_address = shift;
    $sth = $dbh->prepare( "
                            SELECT ifnull(l.created,m.created) created , ifnull(l.str,m.str) str
                            FROM massage as m
                            CROSS JOIN log as l 
                            ORDER BY m.int_id asc
                            LIMIT 100
                            WHERE m.address = ?
                        ");
$sth->execute($input_address);
}
=com
sub _output_to_html {
    
}
=cut
