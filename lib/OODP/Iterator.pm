package OODP::Iterator;
use Moose;
use MooseX::FollowPBP;
our $VERSION = '0.01';
use Carp;

has list => ( is => 'ro', isa => 'Any' );

sub first       { croak "Subclass must implement first()" }
sub next        { croak "Subclass must implement next()" }
sub is_done     { croak "Subclass must implement is_done()" }
sub curr_item   { croak "Subclass must implement curr_item()" }

1;
__END__
=head1 NAME

OODP::Interator - defines an interface for accessing
and traversing elements.

=head1 SYNOPSIS

...

=head1 METHODS

=over 4

=item first()

=item next()

=item is_done()

=item curr_item()

=back

=head1 SEE ALSO

=over 4

=item L<docs/behavioral/iterator.md>

=item L<OODP::Aggregate>

=back

=head1 LICENSE AND COPYRIGHT

See L<License.md>
