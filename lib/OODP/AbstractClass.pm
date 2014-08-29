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

Copyright 2014 Jeffrey Hayes Anderson.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
=cut

1;
