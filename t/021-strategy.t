#!perl -T
#------------------------------------------------------
package MyContext;
use Moose;
extends 'OODP::Context';
sub context { shift->get_strategy->algorithm( @_ ) }

#------------------------------------------------------
package BaseStrategy;
use Moose;
use MooseX::FollowPBP;
extends 'OODP::Strategy';
has data => ( is => 'ro', isa => 'Str', default => 'Hello World' );

#------------------------------------------------------
package MyStrategy1;
use Moose;
extends 'BaseStrategy';
sub algorithm { return shift->get_data }

#------------------------------------------------------
package MyStrategy2;
use Moose;
extends 'BaseStrategy';
sub algorithm { return uc shift->get_data }

#------------------------------------------------------
package MyStrategy3;
use Moose;
extends 'BaseStrategy';
sub algorithm { return lc shift->get_data }

#======================================================
package main;
use strict;
use warnings FATAL => 'all';
use Test::More;
use Test::Exception;

plan tests => 12;

use_ok( 'OODP::Context' )           || print "Bail out!\n";
use_ok( 'OODP::Strategy' )          || print "Bail out!\n";

my $context = new_ok( 'MyContext' );
my $strat1  = new_ok( 'MyStrategy1' );
my $strat2  = new_ok( 'MyStrategy2' );
my $strat3  = new_ok( 'MyStrategy3' );

$context->set_strategy( $strat1 );
isa_ok $context->get_strategy, 'MyStrategy1';
is $context->context, 'Hello World';

$context->set_strategy( $strat2 );
isa_ok $context->get_strategy, 'MyStrategy2';
is $context->context, 'HELLO WORLD';

$context->set_strategy( $strat3 );
isa_ok $context->get_strategy, 'MyStrategy3';
is $context->context, 'hello world';

#my @contexts = map MyContext->new( strategy => $_ ), @strategies;
#isa_ok $_, 'MyContext' for @contexts;
#
#isa_ok $contexts[0]->get_strategy, 'MyStrategy1';
#isa_ok $contexts[1]->get_strategy, 'MyStrategy2';
#isa_ok $contexts[2]->get_strategy, 'MyStrategy3';
#
#is $contexts[0]->context, 'Hello World';
#is $contexts[1]->context, 'HELLO WORLD';
#is $contexts[2]->context, 'hello world';
