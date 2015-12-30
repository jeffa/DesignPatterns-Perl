#!perl -T
#------------------------------------------------------
package MyContext;
use Moose;
extends 'OODP::Context';

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

plan tests => 9;

use_ok 'OODP::Context';
use_ok 'OODP::Strategy';

my $context = new_ok( 'MyContext' );

my $strat1  = new_ok( 'MyStrategy1' );
$context->set_strategy( $strat1 );
is $context->context, 'Hello World',            "correct output MyStrategy1";

my $strat2  = new_ok( 'MyStrategy2' );
$context->set_strategy( $strat2 );
is $context->context, 'HELLO WORLD',            "correct output MyStrategy2";

my $strat3  = new_ok( 'MyStrategy3' );
$context->set_strategy( $strat3 );
is $context->context, 'hello world',            "correct output MyStrategy3";
