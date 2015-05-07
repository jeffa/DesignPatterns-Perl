package OODP::Context;
use Moose;
use MooseX::FollowPBP;
our $VERSION = '0.01';
use Carp;

use OODP::Strategy;

has strategy => (
    is      => 'rw',
    isa     => 'OODP::Strategy',
    handles => [qw( algorithm )],
 );

sub context { shift->algorithm( @_ ) }

1;
__END__
=head1 NAME

OODP::Context - declares the interface used by the client to
defer the decision to the Strategy.

=head1 ATTRIBUTES

=over 4

=item L<strategy>

A reference to a OODP::Strategy subclass.

=back

=head1 METHODS

=over 4

=item L<context>

Calls attached OODP::Strategy subclass's algorithm()

=back

=head1 SEE ALSO

=over 4

=item L<docs/behavioral/strategy.md>

=item L<OODP::Strategy>

=back

=head1 LICENSE AND COPYRIGHT

See L<License.md>
