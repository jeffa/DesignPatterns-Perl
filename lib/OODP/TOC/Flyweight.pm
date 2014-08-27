package OODP::TOC::Flyweight;
our $VERSION = '0.01';

1;
__END__
=head1 NAME

OODP::Structural::Flyweight - supports large numbers of fine-grained
objects efficiently via sharing.

=head1 SYNOPSIS

OODP::Structural::Flyweight is a design pattern that is useful when you:

  - have an application that uses a large number of objects
  - have high storage costs due to sheer quantity of objects
  - have a majority of objects whose state can be made extrinsic
  - have many groups of objects that may be replaced by few shared objects
  - have an application that does not depend on object identity

=head1 PARTICIPANTS

=over 4

=item L<OODP::ConcreteFlyweight>

=item L<OODP::UnsharedConcreteFlyweight>

=item L<OODP::FlyweightFactory>

=back

=head1 SEE ALSO

=over 4

=item L<OODP::TOC::Structural>

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
