package OODP::Composite;
use Moose::Role;
our $VERSION = '0.01';
use Carp;

with 'OODP::Component';

# TODO: replace with OODP::Iterator
has children => ( is => 'rw', isa => 'HashRef', default => sub { {} } );

sub add {
    my ($self,$component) = @_;

    my $name = $component->get_name;

    if ($self->get_child( $name )) {
        croak "cannot add child: existing name '$name'";
    }

    my $children = $self->children;
    $children->{$name} = $component;
    $self->children( $children );

    return $children;
}

sub remove {
    my ($self,$name) = @_;

    my $component;
    my $children = $self->children;

    if ($component = delete $children->{$name}) {
        $self->children( $children );
    }
    
    return $component;
}

sub get_child {
    my ($self,$name) = @_;

    return $self->children->{$name};
}

sub is_composite { $_[0] }


1;
__END__
=head1 NAME

OODP::Composite - defines behavior for components having children.

=head1 SYNOPSIS

OODP::Composite is a role that stores child comonents. The
child-related operations are implemented in the Component interface.

  package Picture;
  use Moose;
  extends 'OODP::Composite';

  sub draw {
    my ($self) = @_;

    $_->draw for $self->get_children();
  } 

=head1 METHODS

=over 4

=item add()

=item remove()

=item get_child()

=item is_composite()

=back

=head1 SEE ALSO

=over 4

=item L<OODP::Structural::Component>

=item L<OODP::Component>

=item L<OODP::Leaf>

=back

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
