package OODP::Observer;
use Moose;
use MooseX::FollowPBP;
use Carp;
our $VERSION = '0.01';

has state   => ( is => 'rw', isa => 'Any' );
has subject => ( is => 'rw', isa => 'Any' );

sub update {
    my $self = shift;
    $self->set_state( $self->get_subject->get_state ); 
}

sub BUILD {
    my $self = shift;
    if ($self->get_subject) {
        $self->get_subject->attach( $self );
    }
}

1;
__END__
=head1 NAME

OODP::Observer - class to be inherited by client subjects.

=head1 SYNOPSIS

OODP::Observer maintains a reference to an OODP::Subject object;
stores a state that remains consistent with the subject's state;
implements the observer updating interface to keep that state consistent.

=head1 METHODS

=over 4

=item update()

Updates self's state to the state of its subject.

=item BUILD

Used to attach self to any subject passed in via construction.

=back

=head1 SEE ALSO

=over 4

=item L<OODP::Behavioral::Observer>

=item L<OODP::Observer>

=item L<OODP::Subject>

=back

=head1 LICENSE AND COPYRIGHT

See L<License.md>
