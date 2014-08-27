package Test::Observer::Time;
use Moose;
use MooseX::FollowPBP;
our $VERSION = '0.01';

extends 'OODP::ConcreteSubject';

has time => ( is => 'rw', isa => 'Int', default => 0 );

sub tick {
    my $self = shift;
    $self->set_time( time() );
}

1;
