package OODP::TOC;
our $VERSION = '0.01';

=head1 NAME

OODP - Object Oriented Design Patterns (with Moose)

=head1 BEHAVIORAL PATTERNS

=over 4

=item * L<OODP::Behavioral::ChainOfResponsibility>

=item * L<OODP::Behavioral::Command>

=item * L<OODP::Behavioral::Interpreter>

=item * L<OODP::Behavioral::Iterator>

=item * L<OODP::Behavioral::Mediator>

=item * L<OODP::Behavioral::Memento>

=item * L<OODP::Behavioral::Observer>

=over 4

=item * L<OODP::Observer>

=item * L<OODP::Subject>

=item * L<OODP::ConcreteObserver>

=item * L<OODP::ConcreteSubject>

=back

=item * L<OODP::Behavioral::State>

=item * L<OODP::Behavioral::Strategy>

=over 4

=item * L<OODP::Context>

=item * L<OODP::Strategy>

=item * L<OODP::ConcreteStrategy>

=back

=item * L<OODP::Behavioral::TemplateMethod>

=item * L<OODP::Behavioral::Visitor>

=back

=head1 CREATIONAL PATTERNS

=over 4

=item * L<OODP::Creational::AbstractFactory>

=item * L<OODP::Creational::Builder>

=item * L<OODP::Creational::FactoryMethod>

=item * L<OODP::Creational::Prototype>

=item * L<OODP::Creational::Singleton>

=back

=head1 STRUCTURAL PATTERNS

=over 4

=item * L<OODP::Structural::Adapter>

=item * L<OODP::Structural::Bridge>

=item * L<OODP::Structural::Composite>

=over 4

=item * L<OODP::Component>

=item * L<OODP::Composite>

=item * L<OODP::Leaf>

=back

=item * L<OODP::Structural::Decorator>

=item * L<OODP::Structural::Facade>

=item * L<OODP::Structural::Flyweight>

=item * L<OODP::Structural::Proxy>

=back

=head1 SEE ALSO

=over 4

=item * L<OODP::Behavioral::TOC>

=item * L<OODP::Creational::TOC>

=item * L<OODP::Structural::TOC>

=back

=head1 AUTHOR

Jeffrey Hayes Anderson, C<< <info+cpan at unlocalhost.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-pattern at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=OODP>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc OODP::TOC

=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2013 Jeffrey Hayes Anderson.

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
