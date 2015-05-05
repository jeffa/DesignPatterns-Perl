package OODP::AbstractWidget;
use Moose;
use MooseX::FollowPBP;
use Carp;
our $VERSION = '0.01';

1;
__END__
=head1 NAME

OODP::AbstractWidget - declares interface for a type of widget object.

=head1 SYNOPSIS

OODP::AbstractWidget is the interface for concrete widgets to be created by
the corresponding concrete factory.

=head1 SEE ALSO

=over 4

=item L<OODP::AbstractFactory>

=item L<OODP::TOC::AbstractFactory>

=item L<OODP::TOC::Creational>

=back

=head1 LICENSE AND COPYRIGHT

See L<License.md>
