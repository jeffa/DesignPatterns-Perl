package OODP::TOC::Flyweight;
our $VERSION = '0.01';

1;
__END__
=head1 NAME

Flyweight - supports large numbers of fine-grained objects efficiently
via sharing.

=head1 SYNOPSIS

Flyweight is a design pattern that is useful when you:

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

See L<License.md>
