package OODP::Aggregate;
use Moose::Role;
use MooseX::FollowPBP;
our $VERSION = '0.01';
use Carp;

has _data => ( is => 'rw', required => 1 );

requires qw( add remove iterator );

around BUILDARGS => sub {
    my $method = shift;
    my $class  = shift;
    return $class->$method( _data => shift );
};

sub get_count { scalar @{ shift->{_data} } }

1;
__END__
=head1 NAME

OODP::Aggregate - defines an interface for creating an iterator object.

=head1 SYNOPSIS

  package My::Aggregate;
  use Moose;
  with 'OODP::Aggregate';
  # must implement required methods

=head1 PROVIDES

=over 4

=item get_count()

Returns how many elements are in the aggregate.

=back

=head1 REQUIRES

=over 4

=item interator()

Will instantiate and return iterator for this aggregate.

=item add()

Will add an item to the aggregate.

=item remove()

Will remove an item from the aggregate.

=back

=head1 SEE ALSO

=over 4

=item L<docs/behavioral/iterator.md>

=item L<OODP::Iterator>

=back

=head1 LICENSE AND COPYRIGHT

See L<License.md>
