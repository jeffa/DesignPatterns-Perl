package OODP::Proxy;
use Moose;
use MooseX::FollowPBP;
our $VERSION = '0.01';
use Carp;

has reference => ( is => 'ro', isa => 'Any' );

sub request     { croak "Subclass must implement request()" }

1;
__END__
=head1 NAME

OODP::Proxy - defines an interface that is identical
to some subject interface such that a Proxy may be
substituted for a concrete subject.

=head1 SYNOPSIS

...

=head1 ATTRIBUTES

=over 4

=item reference

=back

=head1 METHODS

=over 4

=item request()

=back

=head1 SEE ALSO

=over 4

=item L<docs/structural/proxy.md>

=back

=head1 LICENSE AND COPYRIGHT

See L<License.md>
