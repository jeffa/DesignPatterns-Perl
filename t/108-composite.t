#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;
use Test::Exception;

plan tests => 3;

use lib 't/lib';
use_ok( 'Test::Composite::Equipment' )  || print "Bail out!\n";
use_ok( 'Test::Composite::Cabinet' )    || print "Bail out!\n";
use_ok( 'Test::Composite::PS3' )        || print "Bail out!\n";

