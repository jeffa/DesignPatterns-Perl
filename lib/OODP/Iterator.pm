package OODP::Iterator;
use Moose;
use MooseX::FollowPBP;
our $VERSION = '0.01';
use Carp;

has _index      => ( is => 'ro', isa => 'Int', default => 0 ); 
has _aggregate  => ( is => 'ro', isa => 'Any' ); 

sub first       { $_[0]->{_index} = 0 }
sub next        { $_[0]->{_index}++ }
sub is_done     { $_[0]->{_index} >= $_[0]->{_aggregate}->get_count }
sub curr_item   { $_[0]->{_aggregate}{_data}[ $_[0]->{_index} ] }

1;
__END__
=head1 NAME

OODP::Interator - defines an interface for accessing
and traversing elements.

=head1 METHODS

=over 4

=item first()

Resets internal index to first item.

=item next()

Advances internal index to next item.

=item is_done()

Returns status of traversal completion.

=item curr_item()

Returns current item from aggregate.

=back

=head1 SEE ALSO

=over 4

=item L<docs/behavioral/iterator.md>

=item L<OODP::Aggregate>

=back

=head1 LICENSE AND COPYRIGHT

See L<License.md>
