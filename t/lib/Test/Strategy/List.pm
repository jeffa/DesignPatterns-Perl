package Test::Strategy::List;
use Moose;
use MooseX::FollowPBP;
our $VERSION = '0.01';
use Carp;

extends 'OODP::Strategy';

has markup => ( is => 'rw', isa => 'Str' );

1;
