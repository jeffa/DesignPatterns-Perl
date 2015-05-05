package OODP::TOC::Decorator;
our $VERSION = '0.01';

1;
__END__
=head1 NAME

Decorator - attaches additional responsibilites to an object dynamically.
Provides a flexible alternative to subclassing.

=head1 SYNOPSIS

Decorator is a design pattern that is useful for adding responsibilities to
individual objects dynamically and transparently.  Assigned responsibilities
can also be withdrawn dynamically. Also useful when extension by subclassing
is impractical or even impossible.

=head1 STRUCTURE

                +-------------+
                | Component   |
                +-------------+<-------------+
                | operation() |              |
                +------+------+              |
                       |                     |
                      / \                    |
           +--------------------+            |
           |                    |            |
  +------------------+    +--------------+   |
  | ConcreteCompoment|    | Decorator    |   |
  +------------------+    +--------------<>--+
  | opertation()     |    | opertation() |   component
  +------------------+    +-------+------+
                                  |
                                 / \
                        +------------------+
                        |                  |
            +-----------+--------+  +------+-------------+
            | ConcreteDecoratorA |  | ConcreteDecoratorB |
            +--------------------+  +--------------------+
            | opertation()       |  | operation()        |
            +--------------------+  | added_behavior()   |
            | addedState         |  +--------------------+
            +--------------------+

=head1 PARTICIPANTS

=over 4

=item L<OODP::Component>

=item L<OODP::Decorator>

=back

=head1 SEE ALSO

=over 4

=item L<OODP::TOC>

=item L<OODP::TOC::Structural>

=back

=head1 LICENSE AND COPYRIGHT

See L<License.md>
