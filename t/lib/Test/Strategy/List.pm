package Test::Strategy::List;
use Moose::Role;
use MooseX::FollowPBP;
our $VERSION = '0.01';

with 'OODP::ConcreteStrategy';

has markup => ( is => 'rw', isa => 'Str' );

requires qw( render );

1;
