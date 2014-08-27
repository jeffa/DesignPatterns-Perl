package Test::Observer::Clock;
use Moose;
use Carp;
use MooseX::FollowPBP;
our $VERSION = '0.01';

extends 'OODP::Observer';

has sec  => ( is => 'rw', isa => 'Int', default => 0 );
has min  => ( is => 'rw', isa => 'Int', default => 0 );
has hour => ( is => 'rw', isa => 'Int', default => 0 );

sub update {
    my $self = shift;
    ($self->{sec}, $self->{min}, $self->{hour}) = gmtime( $self->get_subject->get_time );
    $self->draw;
}
    
sub draw { croak "Subclass " . __PACKAGE__ . " must implement draw()" }

1;
