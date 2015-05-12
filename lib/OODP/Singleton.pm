package OODP::Singleton;

my %instances = ();

sub new {
    my $class = shift;
    return bless { @_ }, $class;
}


sub singleton {
    my $class = shift;

    unless ($instances{$class}) {
        $instances{$class} = $class->new( @_ );
    }

    return $instances{$class};
}

1;
__END__
=head1 NAME

OODP::Singleton - ensures one and only one instance with global access.

=head1 SYNOPSIS

OODP::Singleton - useful when there must be exactly one instance of a class
and it must be accessible to clients from a well-known point of access.

=head1 SEE ALSO

=over 4

=item L<docs/creational/singleton.md>

=back

=head1 LICENSE AND COPYRIGHT

See L<License.md>
