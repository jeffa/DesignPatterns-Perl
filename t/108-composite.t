#!perl -T
use strict;
use warnings FATAL => 'all';
use Test::More;
use Test::Exception;

plan tests => 22;

use lib 't/lib';
use_ok( 'Test::Composite::Chassis' )    || print "Bail out!\n";
use_ok( 'Test::Composite::Device' )     || print "Bail out!\n";
use_ok( 'Test::Composite::Cabinet' )    || print "Bail out!\n";
use_ok( 'Test::Composite::Console' )    || print "Bail out!\n";
use_ok( 'Test::Composite::Television' ) || print "Bail out!\n";

my $cab = Test::Composite::Cabinet->new( name => 'generic', power => 2 );
isa_ok $cab, 'Test::Composite::Cabinet';
can_ok $cab, 'get_children';

is $cab->get_name, 'generic',           "correct name";
is $cab->get_power, 2,                  "correct power (overriden)";
is $cab->get_net_price, 50,             "correct net_price";
is $cab->get_discount_price, 40,        "correct discount_price";

my $con = Test::Composite::Console->new( name => 'Nintendo Wii', net_price => '400' );
isa_ok $con, 'Test::Composite::Console';
is $con->get_name, 'Nintendo Wii',      "correct name";
is $con->get_power, 40,                 "can override defaults";
is $con->get_net_price, 400,            "default net_price";
is $con->get_discount_price, 300,       "default discount_price";

$cab->add( $con );
is scalar keys %{ $cab->get_children }, 1,  "cabinate contains 1 device";
is $cab->get_total_net_price, 400,          "correct total net price";

$cab->add( Test::Composite::Console->new( name => 'PS3', power => 30 ) );
is scalar keys %{ $cab->get_children }, 2,  "cabinate contains 2 devices";
is $cab->get_total_net_price, 1000,         "correct total net price";

$cab->add( Test::Composite::Television->new( name => 'Toshiba' ) );
is scalar keys %{ $cab->get_children }, 3,  "cabinate contains 3 devices";
is $cab->get_total_net_price, 2600,         "correct total net price";
