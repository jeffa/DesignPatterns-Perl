package Test::AbstractFactory::Maze;
use Moose;
use MooseX::FollowPBP;
use Carp;
our $VERSION = '0.01';

has grid   => ( is => 'ro', isa => 'ArrayRef', default => sub {[]}  );
has width  => ( is => 'ro', isa => 'Int', default => 3 );
has height => ( is => 'ro', isa => 'Int', default => 3 );

sub add_room {
    my ($self, $factory) = @_;

    if ($self->grid_size > $self->get_width * $self->get_height) {
        carp "out of bounds!\n";
        return;
    }
    push @{ $self->{grid} }, $factory->make_room( number => $self->generate_code );
}

sub get_room {
    my ($self, $code) = @_;
    my ($alpha, $numeric) = $code =~ /([A-Z]+)(\d+)/;

    my $index = (ord( $alpha ) - 65) * $self->get_width + $numeric;
    if ($index > $self->get_width * $self->get_height) {
        carp "out of bounds!\n";
        return;
    }
    return $self->{grid}[$index];
}

sub generate_code {
    my $self = shift;
    my $curr = $self->grid_size;
    return chr( 65 + int($curr / $self->get_width) ) . ($curr % $self->get_width);
}

sub grid_size { @{ shift->get_grid } }


1;
