package OODP::Composite;
use Moose;
use MooseX::FollowPBP;
our $VERSION = '0.01';
use Carp;

extends 'OODP::Component';

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
__END__
=head1 NAME

OODP::Composite - defines behavior for components having children.

=head1 SYNOPSIS

OODP::Composite is a class that stores child components. The child
related operations are implemented in the Component interface.

  package MyCompositeInterface;
    use Moose;
    extends 'OODP::Composite';
    has attribute ( is => 'rw', isa => 'Any' );

  package MyComposite;
    use Moose;
    extends 'MyCompositeInterface';
    has attribute ( default => 'some value' );

  package main;
    use MyLeaf;
    use MyComposite;
    my $obj = MyComposite->new;
    $obj->add( MyLeaf->new, MyLeaf->new );
    $obj->draw;

=head1 METHODS

=over 4

=item add()

=item remove()

=item get_child()

=item is_composite()

=back

=head1 SEE ALSO

=over 4

=item L<OODP::Structural::Component>

=item L<OODP::Component>

=item L<OODP::Leaf>

=back

=head1 LICENSE AND COPYRIGHT

See L<license.md>
