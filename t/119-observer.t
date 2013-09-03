#!perl -T
use strict;
use warnings FATAL => 'all';
use Test::More;
use Test::Exception;

plan tests => 13;

use lib 't/lib';
use_ok( 'Test::Observer::Time' )            || print "Bail out!\n";
use_ok( 'Test::Observer::Clock' )           || print "Bail out!\n";
use_ok( 'Test::Observer::Clock::Digital' )  || print "Bail out!\n";
use_ok( 'Test::Observer::Clock::Analog' )   || print "Bail out!\n";

my $subject = new_ok 'Test::Observer::Time' => [ time => 1378218830 ];
my $clock_d = new_ok 'Test::Observer::Clock::Digital' => [ subject => $subject ];
my $clock_a = new_ok 'Test::Observer::Clock::Analog'  => [ subject => $subject ];

is scalar @{$subject->{observers}}, 2, "subject has correct number of observers";
is $subject->get_time, 1378218830, "correct time inserted";

is $clock_a->draw, '00:00:00', "analog clock has not been updated";
is $clock_d->draw,
" 000   000      000   000      000   000  
0  00 0  00 :: 0  00 0  00 :: 0  00 0  00 
0 0 0 0 0 0    0 0 0 0 0 0    0 0 0 0 0 0 
00  0 00  0 :: 00  0 00  0 :: 00  0 00  0 
 000   000      000   000      000   000  
", "digital clock has not been updated";

$subject->notify;
is $clock_a->draw, '14:33:50', "analog clock has been updated";
is $clock_d->draw,
" 11  4  4    333  333     5555  000  
111  4  4 ::    3    3 :: 5    0  00 
 11  4444     33   33     555  0 0 0 
 11     4 ::    3    3 ::    5 00  0 
1111    4    333  333     555   000  
", "digital clock has been updated";
