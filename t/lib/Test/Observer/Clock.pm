package Test::Observer::Clock;
use Moose;
use Carp;
use MooseX::FollowPBP;
our $VERSION = '0.01';

with 'OODP::ConcreteObserver';

has sec  => ( is => 'rw', isa => 'Int', default => 0 );
has min  => ( is => 'rw', isa => 'Int', default => 0 );
has hour => ( is => 'rw', isa => 'Int', default => 0 );

sub update {
    my $self = shift;
    ($self->{sec}, $self->{min}, $self->{hour}) = gmtime( $self->get_subject->get_time );
    $self->draw;
}
    
sub draw { croak "Subclass " . __PACKAGE__ . " must implement draw()" }

sub BUILD {
    my $self = shift;
    if ($self->get_subject) {
        $self->get_subject->attach( $self );
    }
}

1;
