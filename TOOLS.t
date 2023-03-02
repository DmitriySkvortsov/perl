#!/usr/bin/perl

use Test::More tests=>1;

require_ok('TOOLS.pm');

$ent = 'sadSad@Sad';
ok(login($ent) eq 1);