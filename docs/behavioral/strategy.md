package OODP::TOC::Strategy;
our $VERSION = '0.01';

1;
__END__
=head1 NAME

Strategy - defines a family of algorithms, encapsulates each one and makes
them interchangeable.

=head1 SYNOPSIS

Strategy is a design pattern that is useful when you need an algorithm that
varies independently from clients that use it.

=head1 STRUCTURE

    +------------+             +-------------+
    | Context    |             | Strategy    |
    +------------+<>---------->+-------------+
    | context()  |             | algorithm() |
    +------------+             +------+------+
                                      |
                                     / \
              +------------------------------------+
              |                 |                  |
              |                 |                  |
       +------+------+   +------+------+   +-------+-----+
       | ConcreteS.  |   | ConcreteS.  |   | ConcreteS.  |
       +-------------+   +-------------+   +-------------+
       | algorithm() |   | algorithm() |   | algorithm() |
       +-------------+   +-------------+   +-------------+

=head1 PARTICIPANTS

=over 4

=item L<OODP::Strategy>

=item L<OODP::ConcreteStrategy>

=item L<OODP::Context>

=back

=head1 SEE ALSO

=over 4

=item L<OODP::TOC::Behavioral>

=back

=head1 LICENSE AND COPYRIGHT

See L<license.md>
