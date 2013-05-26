#!perl -T
use strict;
use warnings FATAL => 'all';
use Test::More;
use Test::Exception;

plan tests => 17;

use lib 't/lib';
use_ok( 'Test::Composite::Chassis' )    || print "Bail out!\n";
use_ok( 'Test::Composite::Device' )     || print "Bail out!\n";
use_ok( 'Test::Composite::Cabinet' )    || print "Bail out!\n";
use_ok( 'Test::Composite::PS3' )        || print "Bail out!\n";

my $cab = Test::Composite::Cabinet->new( name => 'generic', power => 2 );
isa_ok $cab, 'Test::Composite::Cabinet';
can_ok $cab, 'get_children';

is $cab->get_name, 'generic',           "correct name";
is $cab->get_power, 2,                  "correct power (overriden)";
is $cab->get_net_price, 50,             "correct net_price";
is $cab->get_discount_price, 40,        "correct discount_price";

my $ps3 = Test::Composite::PS3->new( name => 'scooby', net_price => '400' );
isa_ok $ps3, 'Test::Composite::PS3';
is $ps3->get_name, 'scooby',            "correct name";
is $ps3->get_power, 40,                 "can override defaults";
is $ps3->get_net_price, 400,            "default net_price";
is $ps3->get_discount_price, 300,       "default discount_price";

$cab->add( Test::Composite::PS3->new( name => 'shaggy', power => 30 ) );
$cab->add( $ps3 );

is scalar keys %{ $cab->get_children }, 2,  "cabinate contains 2 consoles";
is $cab->get_total_net_price, 1000,         "correct total net price";
