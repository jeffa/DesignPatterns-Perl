#!perl -T
use strict;
use warnings FATAL => 'all';
use Test::More;
use Test::Exception;

plan tests => 11;

use lib 't/lib';
use_ok( 'Test::Observer::Time' )            || print "Bail out!\n";
use_ok( 'Test::Observer::Clock' )           || print "Bail out!\n";
use_ok( 'Test::Observer::Clock::Digital' )  || print "Bail out!\n";
use_ok( 'Test::Observer::Clock::Analog' )   || print "Bail out!\n";

my $subject = new_ok 'Test::Observer::Time' => [ time => 1378218830 ];
my $clock_d = new_ok 'Test::Observer::Clock::Digital';
my $clock_a = new_ok 'Test::Observer::Clock::Analog';

is $subject->get_time, 1378218830, "correct time inserted";

$subject->attach( $clock_d );
$subject->attach( $clock_a );

is $clock_a->draw, '00:00:00', "analog clock has not been updated";

$subject->notify;
is $clock_a->draw, '07:33:50', "analog clock has been updated";

is $clock_d->draw,
" 000  77777    333  333     5555  000  
0  00    7  ::    3    3 :: 5    0  00 
0 0 0   7       33   33     555  0 0 0 
00  0   7   ::    3    3 ::    5 00  0 
 000    7      333  333     555   000  
", "digital clock has been updated";
