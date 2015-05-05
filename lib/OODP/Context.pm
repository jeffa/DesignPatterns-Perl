package OODP::Context;
use Moose;
use MooseX::FollowPBP;
our $VERSION = '0.01';
use Carp;

use OODP::Strategy;

has strategy => ( is => 'rw', isa => 'OODP::Strategy', required => 1 );

1;
__END__
=head1 NAME

OODP::Context - declares the interface used by the client to
defer the decision to the Strategy.

=head1 SYNOPSIS

OODP::Context ...

=head1 SEE ALSO

=over 4

=item L<OODP::ConcreteStrategy>

=item L<OODP::Strategy>

=back

=head1 LICENSE AND COPYRIGHT

See L<license.md>
