#!perl -T
#------------------------------------------------------
package MyList;
use Moose;
extends 'OODP::Aggregate';

#------------------------------------------------------
package MyIterator;
use Moose;
extends 'OODP::Iterator';

#======================================================
package main;
use strict;
use warnings FATAL => 'all';
use Test::More;
use Test::Exception;

plan tests => 4;

use_ok 'OODP::Aggregate';
use_ok 'OODP::Iterator';

my $aggr = new_ok 'MyList';
my $iter = new_ok 'MyIterator';
