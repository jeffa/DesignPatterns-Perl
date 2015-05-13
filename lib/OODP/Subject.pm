package OODP::Subject;
use Moose;
use MooseX::FollowPBP;
use OODP::Aggregate;
use Carp;
our $VERSION = '0.01';

has state     => ( is => 'rw', isa => 'Any' );
has observers => ( is => 'ro', isa => 'OODP::Iterator', handles => [qw( add remove get_count )] );

around BUILDARGS => sub {
    my $orig  = shift;
    my $class = shift;
    my $aggr  = OODP::Aggregate->new;
    return $class->$orig( observers => $aggr->iterator, @_ );
};


sub attach {
    my ($self, $observer) = @_;
    $observer->set_subject( $self );
    $self->add( $observer );
}

sub detach {
    my ($self, $observer) = @_;
    $self->remove( $observer );
}

sub notify {
    my $self = shift;
    my $iter = $self->get_observers;
    $iter->first;
    while (! $iter->is_done) {
        $iter->curr_item->update( @_ );
        $iter->next;
    }
    return $self;
}

1;
__END__
=head1 NAME

OODP::Subject - class to be inherited by client subjects.

=head1 SYNOPSIS

OODP::Subject stores the state of interest to observer objects
and sends notification to its observers when its state changes.

=head1 METHODS

=over 4

=item attach()

Adds observer to observers.

=item detach()

Removes observer from observers.

=item notify()

Calls each observer's update() method.

=back

=head1 SEE ALSO

=over 4

=item L<docs/behavioral/observer.md>

=item L<OODP::Observer>

=back

=head1 LICENSE AND COPYRIGHT

See L<License.md>
