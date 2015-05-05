package OODP::Component;
use Moose;
use MooseX::FollowPBP;
our $VERSION = '0.01';
use Carp;

has children => ( is => 'rw', isa => 'Any' );
has parent   => ( is => 'rw', isa => 'OODP::Composite' );
has name     => ( is => 'ro', isa => 'Str', required => 1 );

sub add             { croak "Must implement add()" }
sub remove          { croak "Must implement remove()" }
sub get_child       { croak "Must implement get_child()" }
sub is_composite    { croak "Must implement is_composite()" }

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

=item L<OODP::Structural::Component>

=item L<OODP::Leaf>

=item L<OODP::Composite>

=back

=head1 LICENSE AND COPYRIGHT

See L<License.md>
