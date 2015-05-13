use strict;
use warnings FATAL => 'all';
use Test::More;
use Test::Exception;

use Data::Dumper;

plan tests => 22;

use_ok 'OODP::Aggregate';
use_ok 'OODP::Iterator';

my $list = new_ok 'OODP::Aggregate', [ [1 .. 5] ];
my $iter = $list->iterator;
isa_ok $iter, 'OODP::Iterator';

ok !$iter->is_done, "iterator is not done";

my $i = 1;
while (!$iter->is_done) {
    is $iter->curr_item, $i, "correct current item: $i";
    $iter->next;
    $i++;
}
ok $iter->is_done, "iterator is done";

$iter->add( 6 .. 10 );
ok !$iter->is_done, "iterator is not done";

while (!$iter->is_done) {
    is $iter->curr_item, $i, "correct current item: $i";
    $iter->next;
    $i++;
}
ok $iter->is_done, "iterator is done";

$iter->add( 11, 12 );
ok !$iter->is_done, "iterator is not done";

$iter->remove( 11 );
ok !$iter->is_done, "iterator is not done";

$iter->remove( 12 );
ok $iter->is_done, "iterator is now done";

$iter->first;
ok !$iter->is_done, "iterator has been reset";

