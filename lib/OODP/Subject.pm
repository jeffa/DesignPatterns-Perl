package OODP::Subject;
use Moose;
use MooseX::FollowPBP;
use Carp;
our $VERSION = '0.01';

has state     => ( is => 'rw', isa => 'Any' );
has observers => ( is => 'ro', isa => 'ArrayRef', default => sub {[]} );

sub attach {
    my ($self, $observer) = @_;
    $observer->set_subject( $self );
    push @{ $self->{observers} }, $observer;
}

sub detach {
    my ($self, $observer) = @_;
    for (0 .. $#{ $self->{observers} }) {
        if ($observer == $self->{observers}[$_] ) {
            splice @{ $self->{observers} }, $_, 1;
            last;
        }
    }
}

sub notify {
    my $self = shift;
    $_->update( @_ ) for @{ $self->get_observers };
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

=item L<OODP::Behavioral::Observer>

=item L<OODP::Observer>

=item L<OODP::Subject>

=back

=head1 LICENSE AND COPYRIGHT

See L<license.md>
