package OODP::Aggregate;
use Moose;
use MooseX::FollowPBP;
our $VERSION = '0.01';
use Carp;
use OODP::Iterator;

has _data => ( is => 'rw', required => 1 );

around BUILDARGS => sub {
    my $method = shift;
    my $class  = shift;
    return $class->$method( _data => shift );
};

sub iterator    { OODP::Iterator->new( _aggregate => shift ) }
sub get_count   { scalar @{ shift->{_data} } }
sub add         { push @{ shift->{_data} }, @_ }

sub remove {
    my $self = shift;
    my $item = shift;

    for (0 .. $#{ $self->{_data} }) {
        if ($item == $self->{_data}[$_] ) {
            splice @{ $self->{_data} }, $_, 1;
            last;
        }
    }
}


1;
__END__
=head1 NAME

OODP::Aggregate - defines an interface for creating an iterator object.

=head1 SYNOPSIS

  use OODP::Aggregate;

  my $list = OODP::Aggregate->new( \@array );
  my $iter = $list->iterator;
  while (! $iter->is_done) {
    print $iter->curr_item;
    $iter->next;
  }

=head1 METHODS

=over 4

=item iterator()

Will instantiate and return iterator for this aggregate.

=item get_count()

Returns how many elements are in the aggregate.

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
