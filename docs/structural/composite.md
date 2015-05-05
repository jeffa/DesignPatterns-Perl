package OODP::TOC::Composite;
our $VERSION = '0.01';

=head1 NAME

OODP::Structural::Composite - Represents part-whole hierarchies of
objects without regard to distinction between those objects' compositions.

=head1 SYNOPSIS

OODP::Structural::Composite is a design pattern that is useful when you
want clients to be able to ignore the difference between compositions of
objects and individual objects. Clients will treat all objects in the
composite structure uniformly.

=head1 STRUCTURE

       +------+     +----------------+
       |client|---->|   Component    |
       +------+     +----------------*<---------+
                    | add()          |          |
                    | remove()       |          |
                    | get_child()    |          |
                    | is_composite() |          |
                    +-----+----------+          |
                          |                     |
                         / \                    |
           +-------------------+                |
           |                   |                |
       +--------+      +-------------+          |
       |  Leaf  |      |  Composite  | children |
       +--------+      +-------------<>---------+
       | draw() |      | draw()      |
       +------+-+      +-------------+

=head1 PARTICIPANTS

=over 4

=item L<OODP::Component>

=item L<OODP::Leaf>

=item L<OODP::Composite>

=back

=head1 SEE ALSO

=over 4

=item L<OODP::TOC::Structural>

=back

See L<License.md>
