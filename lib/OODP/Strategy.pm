package OODP::Strategy;
use Moose;
use MooseX::FollowPBP;
our $VERSION = '0.01';
use Carp;

sub algorithm { croak "Subclass must define algorithm()" }

1;
__END__
=head1 NAME

OODP::Strategy - declares a common interface for all supported
algorithms which is in turn used by L<OODP::Context> to call the
algorithm defined by a concrete Strategy.

=head1 SYNOPSIS

OODP::Strategy ...

=head1 SEE ALSO

=over 4

=item L<OODP::ConcreteStrategy>

=item L<OODP::Context>

=back

=head1 LICENSE AND COPYRIGHT

See L<License.md>
