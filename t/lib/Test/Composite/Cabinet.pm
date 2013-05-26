package Test::Cabinet;
use Moose::Role;
use MooseX::FollowPBP;
our $VERSION = '0.01';
use Carp;

with 'Test::Equipment';

# TODO: replace with OODP::Iterator
has children => ( is => 'rw', isa => 'HashRef', default => sub { {} } );

sub add {
    my ($self,$component) = @_;

    my $name = $component->get_name;

    if ($self->get_child( $name )) {
        croak "cannot add child: existing name '$name'";
    }

    my $children = $self->get_children;
    $children->{$name} = $component;
    $self->set_children( $children );

    return $children;
}

sub remove {
    my ($self,$name) = @_;

    my $component;
    my $children = $self->get_children;

    if ($component = delete $children->{$name}) {
        $self->set_children( $children );
    }
    
    return $component;
}

sub get_child {
    my ($self,$name) = @_;

    return $self->get_children->{$name};
}

sub is_composite { $_[0] }


1;
