use 5.006;
use strict;
use warnings FATAL => 'all';
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'Pattern',
    AUTHOR           => q{Jeffrey Hayes Anderson <info+cpan@unlocalhost.com>},
    VERSION_FROM     => 'lib/Pattern.pm',
    ABSTRACT_FROM    => 'lib/Pattern.pm',
    LICENSE          => 'Artistic_2_0',
    PL_FILES         => {},
    MIN_PERL_VERSION => 5.006,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES => {
        'Test::More' => 0,
    },
    PREREQ_PM => {
        #'ABC'              => 1.6,
        #'Foo::Bar::Module' => 5.0401,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'Pattern-*' },
);
