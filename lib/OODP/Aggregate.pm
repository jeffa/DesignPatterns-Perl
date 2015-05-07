package OODP::Aggregate;
use Moose;
use MooseX::FollowPBP;
our $VERSION = '0.01';
use Carp;

sub create_iterator { croak "Subclass must implement create_iterator()" }

1;
__END__
=head1 NAME

OODP::Aggregate - defines an interface for creating an iterator object.

=head1 SYNOPSIS

...

=head1 METHODS

=over 4

=item create_iterator()

=back

=head1 SEE ALSO

=over 4

=item L<docs/behavioral/iterator.md>

=item L<OODP::Iterator>

=back

=head1 LICENSE AND COPYRIGHT

See L<License.md>
