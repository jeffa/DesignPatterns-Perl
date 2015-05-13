#!perl -T
#------------------------------------------------------
package My::Aggregate;
use Moose;
with 'OODP::Aggregate';

sub add { }
sub remove { }
sub iterator { My::Iterator->new( _aggregate => shift ) }

#------------------------------------------------------
package My::Iterator;
use Moose;
with 'OODP::Iterator';

#======================================================
package main;
use strict;
use warnings FATAL => 'all';
use Test::More;
use Test::Exception;

use Data::Dumper;

plan tests => 12;

use_ok 'OODP::Aggregate';
use_ok 'OODP::Iterator';

my $list = new_ok 'My::Aggregate', [ [1 .. 5] ];
my $iter = $list->iterator;
isa_ok $iter, 'My::Iterator';

ok !$iter->is_done, "iterator is not done";

my $i = 1;
while (!$iter->is_done) {
    is $iter->curr_item, $i, "correct current item: $i";
    $iter->next;
    $i++;
}

ok $iter->is_done, "iterator is done";
$iter->first;
ok !$iter->is_done, "iterator has been reset";
