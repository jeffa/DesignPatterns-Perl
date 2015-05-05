package OODP::TOC::Observer;
our $VERSION = '0.01';

1;
__END__
=head1 NAME

Observer - defines a one-to-many dependency between objects so that
when one object changes state, all its dependents are notified and
updated automatically.

=head1 SYNOPSIS

Observer is a design pattern that is useful when a change to one object
requires changing others without knowing how many objects need to be
changed and no assumptions about who the objects are needs to be made.
Promotes loose coupling.

=head1 STRUCTURE


   +-----------+  observers              +-----------+
   |  Subject  |------------------------>* Observer  |
   +-----------+                         +-----------+
   |  attach() |                         | update()  |
   |  detach() |                         +-----+-----+
   |  notify() |                               ^
   +------+----+                               |
          ^                            +-------+----------+
          |                            | ConcreteObserver |
          |                            +------------------+
   +------+-----------+        subject | update()         |
   |  ConcreteSubject |<---------------| observer_state() |
   +------------------+                +------------------+
   |  get_state()     |
   |  set_state()     |
   +------------------+


=head1 PARTICIPANTS

=over 4

=item L<OODP::Subject>

=item L<OODP::Observer>

=item L<OODP::ConcreteSubject>

=item L<OODP::ConcreteObserver>

=back

=head1 SEE ALSO

=over 4

=item L<OODP::TOC::Behavioral>

=back

=head1 LICENSE AND COPYRIGHT

See L<License.md>
