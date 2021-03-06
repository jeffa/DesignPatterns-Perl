package OODP::Component;
use Moose;
use MooseX::FollowPBP;
our $VERSION = '0.01';
use Carp;

has children => ( is => 'rw', isa => 'Any' );
has parent   => ( is => 'rw', isa => 'OODP::Composite' );
has name     => ( is => 'ro', isa => 'Str', required => 1 );

sub add             { croak "Subclass must implement add()" }
sub remove          { croak "Subclass must implement remove()" }
sub get_child       { croak "Subclass must implement get_child()" }
sub is_composite    { croak "Subclass must implement is_composite()" }

1;
__END__
=head1 NAME

OODP::Component - declares the interface for objects in the composition.

=head1 SYNOPSIS

OODP::Component declares the interface and implements default behavior
for the interface common to all classes. It is not meant to be implemented
by the client, but rather by concrete interfaces themselves (e.g. Leaf,
Composite, ConcreteComponent).

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

=item L<OODP::Leaf>

=item L<docs/structural/decorator.md>

=item L<OODP::Decorator>

=back

=head1 LICENSE AND COPYRIGHT

See L<License.md>
