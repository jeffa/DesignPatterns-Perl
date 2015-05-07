package OODP::Decorator;
use Moose;
use MooseX::FollowPBP;
use Carp;
our $VERSION = '0.01';

extends 'OODP::Component';

has component => ( is => 'rw', isa => 'OODP::Component' );

1;
__END__
=head1 NAME

OODP::Decorator - add or remove responsibilities without affecting other
objects. Provides a flexible alternative to subclassing.

=head1 SYNOPSIS

OODP::Decorator provides a way to add responsibilities to individual
objects and not to the classes themselves.

=head1 SEE ALSO

=over 4

=item L<OODP::TOC>

=item L<docs/structural/decorator.md>

=item L<OODP::Component>

=back

=head1 LICENSE AND COPYRIGHT

See L<License.md>
