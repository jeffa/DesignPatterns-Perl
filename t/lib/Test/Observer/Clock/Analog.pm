package Test::Observer::Clock::Analog;
use Moose;
our $VERSION = '0.01';

extends 'Test::Observer::Clock';

sub draw {
    my $self = shift;
    return sprintf '%02d:%02d:%02d', $self->get_hour, $self->get_min, $self->get_sec;
}

1;
