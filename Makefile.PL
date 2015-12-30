use 5.006;
use strict;
use warnings FATAL => 'all';
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'OODP',
    AUTHOR           => q{Jeffrey Hayes Anderson <info+cpan@unlocalhost.com>},
    VERSION_FROM     => 'lib/OODP.pm',
    ABSTRACT_FROM    => 'lib/OODP.pm',
    LICENSE          => 'Artistic_2_0',
    PL_FILES         => {},
    MIN_PERL_VERSION => 5.006,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES => {
        'Test::More'        => 0,
        'Moose'             => 0,
        'MooseX::FollowPBP' => 0,
        'File::Slurp'       => 0,
        'XML::Simple'       => 0,
        'FreezeThaw'        => 0,
        'JSON'              => 0,
        'Capture::Tiny'     => 0,
    },
    PREREQ_PM => { },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'OODP-*' },
);
