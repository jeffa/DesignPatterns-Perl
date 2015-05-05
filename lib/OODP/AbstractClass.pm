package OODP::AbstractClass;
use Moose;
use MooseX::FollowPBP;
use Carp;
our $VERSION = '0.01';

sub template_method     { croak "Subclass must implement 'template method' function" }
sub primitive_operation { croak "Subclass must implement 'primitive operation' functions" }

1;
__END__
=head1 NAME

OODP::AbstractClass - defines primitive operations and template method
that concrete subclasses define to implement steps of an algorithm.

=head1 SYNOPSIS

OODP::AbstractClass is a base class that can be used by subclasses
in order to define a skeleton of an algorithm in the base class
but allow the subclasses to implement (hook) to individual steps
of the defined algorithm.

=head1 METHODS

=over 4

=item template_method()

  Defines the steps of the alorithm. This method is simply a placeholder
  and not meant to be used. Instead, define your own template_method
  with a name that makes sense for your needs.

=item primitive_operation()

  Implements a step of the algorithm. This method is simply a placeholder
  and not meant to be used. Instead, define several operations with names
  that make sense for your needs.

=back

=head1 SEE ALSO

=over 4

=item L<OODP::TOC::TemplateMethod>

=item L<OODP::TOC::Behavioral>

=item L<OODP::TOC>

=back

=head1 LICENSE AND COPYRIGHT

See L<license.md>
