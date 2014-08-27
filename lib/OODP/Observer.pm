package OODP::Observer;
use Moose;
use MooseX::FollowPBP;
use Carp;
our $VERSION = '0.01';

has state   => ( is => 'rw', isa => 'Any' );
has subject => ( is => 'rw', isa => 'Any' );

sub update {
    my $self = shift;
    $self->set_state( $self->get_subject->get_state ); 
}

sub BUILD {
    my $self = shift;
    if ($self->get_subject) {
        $self->get_subject->attach( $self );
    }
}

1;
__END__
=head1 NAME

OODP::Observer - class to be inherited by client subjects.

=head1 SYNOPSIS

OODP::Observer maintains a reference to an OODP::Subject object;
stores a state that remains consistent with the subject's state;
implements the observer updating interface to keep that state consistent.

=head1 METHODS

=over 4

=item update()

Updates self's state to the state of its subject.

=item BUILD

Used to attach self to any subject passed in via construction.

=back

=head1 SEE ALSO

=over 4

=item L<OODP::Behavioral::Observer>

=item L<OODP::Observer>

=item L<OODP::Subject>

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
