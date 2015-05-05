package OODP::AbstractFactory;
use Moose;
use MooseX::FollowPBP;
use Carp;
our $VERSION = '0.01';

1;
__END__
=head1 NAME

OODP::AbstractFactory - declares an interface for operations that create
abstract widget objects.

=head1 SYNOPSIS

OODP::AbstractFactory is the interface for concrete factories that implement
the operations to create concrete widget objects.

=head1 SEE ALSO

=over 4

=item L<OODP::AbstractWidget>

=item L<OODP::TOC::AbstractFactory>

=item L<OODP::TOC::Creational>

=back

=head1 LICENSE AND COPYRIGHT

See L<license.md>
