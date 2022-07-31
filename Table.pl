#!/usr/bin/perl
use warnings;
use strict;

use encoding "utf8",STDOUT=>"cp866",STDIN=>"cp866";

my @name = ("Иван", "Андрей", "Алексей", "Дмитрий", "Антон", "Юрий", "Александр", "Николай", "Максим", "Сергей");

print ("Введите имя\n");
$a = <STDIN>;
chomp ($a) ;


if($a =~ $name[0]){
print "Привет $name[0]\n";
}elsif($a =~ $name[1]){
print "Привет $name[1]\n";
}elsif($a =~ $name[2]){
print "Привет $name[2]\n";
}elsif($a =~ $name[3]){
print "Привет $name[3]\n";
}elsif($a =~ $name[4]){
print "Привет $name[4]\n";
}elsif($a =~ $name[5]){
print "Привет $name[5]\n";
}elsif($a =~ $name[6]){
print "Привет $name[6]\n";
}elsif($a =~ $name[7]){
print "Привет $name[7]\n";
}elsif($a =~ $name[8]){
print "Привет $name[8]\n";
}elsif($a =~ $name[9]){
print "Привет $name[9]\n";
}else{
print "$a не найден в системе\n";};



