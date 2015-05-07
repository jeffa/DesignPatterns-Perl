package OODP::Leaf;
use Moose;
use MooseX::FollowPBP;
our $VERSION = '0.01';

extends 'OODP::Component';

sub add             {} 
sub remove          {} 
sub get_child       {} 
sub is_composite    {}

1;
__END__
=head1 NAME

OODP::Leaf - represents primitive objects in the composition.
etc.).

=head1 SYNOPSIS

OODP::Leaf is a class that represents and defines behavior for
primitive objects in the composition. A leaf has no children
(e.g. Rectangle, Line, Text, etc.).

  package MyLeafInterface;
    use Moose;
    extends 'OODP::Leaf';
    has attribute ( is => 'rw', isa => 'Any' );
    sub draw { "magic" } 

  package MyLeaf;
    use Moose;
    extends 'MyLeafInterface';
    has attribute ( default => 'some value' );

  package main;
    use MyLeaf;
    my $obj = MyLeaf->new;
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

=item L<docs/structural/composite.md>

=item L<OODP::Composite>

=item L<OODP::Component>

=back

=head1 LICENSE AND COPYRIGHT

See L<License.md>
