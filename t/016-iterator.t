use strict;
use warnings FATAL => 'all';
use Test::More;
use Test::Exception;

use Data::Dumper;

plan tests => 19;

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

$iter->first;
ok !$iter->is_done, "iterator has been reset";

