package OODP::Subject;
use Moose;
use MooseX::FollowPBP;
use Carp;
our $VERSION = '0.01';

has state     => ( is => 'rw', isa => 'Any' );
has observers => ( is => 'ro', isa => 'ArrayRef', default => sub {[]} );

sub attach {
    my ($self, $observer) = @_;
    $observer->set_subject( $self );
    push @{ $self->{observers} }, $observer;
}

sub detach {
    my ($self, $observer) = @_;
    for (0 .. $#{ $self->{observers} }) {
        if ($observer == $self->{observers}[$_] ) {
            splice @{ $self->{observers} }, $_, 1;
            last;
        }
    }
}

sub notify {
    my $self = shift;
    $_->update for @{ $self->get_observers };
}


1;
__END__
=head1 NAME

OODP::Subject - class to be inherited by client subjects.

=head1 SYNOPSIS

OODP::Subject stores the state of interest to observer objects
and sends notification to its observers when its state changes.

=head1 METHODS

=over 4

=item attach()

Adds observer to observers.

=item detach()

Removes observer from observers.

=item notify()

Calls each observer's update() method.

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
