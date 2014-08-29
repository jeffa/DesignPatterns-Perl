#!perl -T
use strict;
use warnings FATAL => 'all';
use Test::More;
use Test::Exception;
use File::Slurp;

plan tests => 30;

use lib 't/lib';
use_ok $_ for qw(
    Test::Decorator::Stream
    Test::Decorator::MemoryStream
    Test::Decorator::FileStream
    Test::Decorator::StreamDecorator
    Test::Decorator::LowerCasingFilter
    Test::Decorator::UpperCasingFilter
);

my $mem_stream = new_ok 'Test::Decorator::MemoryStream' => [
    name   => 'TD-MS1',
    buffer => '0123456789',
];

is $mem_stream->output, '0123456789',       "correct MS buffer";
is $mem_stream->buffer_size, 10,            "correct MS buffer size";

my $overflow = $mem_stream->append( '0123456789' x 25 );
is $overflow, '0123456789' x 26,            "correct overflow";
is $mem_stream->output, '',                 "correct MS buffer after overflow";
is $mem_stream->buffer_size, 0,             "correct MS buffer size after overflow";

$overflow = $mem_stream->append( 'Hello World' );
is $mem_stream->output, 'Hello World',      "correct MS buffer";
is $mem_stream->buffer_size, 11,            "correct MS buffer size";
is $overflow, '',                           "correct empty overflow";

my $uc_stream = new_ok 'Test::Decorator::UpperCasingFilter' => [ name => 'TD-UCF1', component => $mem_stream ];
is $uc_stream->output, 'HELLO WORLD',       "correct UC buffer";
is $uc_stream->buffer_size, 11,             "correct UC buffer size";


my $file_stream = new_ok 'Test::Decorator::FileStream' => [
    name   => 'TD-FS1',
    buffer => '0123456789',
];
is $file_stream->output, '0123456789',      "correct FS buffer";
is $file_stream->buffer_size, 10,           "correct FS buffer size";
is $file_stream->get_tmp_filename, '',      "correct empty tmp_filename";

$overflow = $file_stream->append( '0123456789' x 25 );
is $file_stream->output, '',                "correct FS buffer after overflow";
is $file_stream->buffer_size, 0,            "correct FS buffer size after overflow";

my $tmp_filename = $file_stream->get_tmp_filename;
ok $tmp_filename,                           "got a tmp_filename: $tmp_filename";
ok -f $tmp_filename,                        "temp file exists";
is read_file( $tmp_filename ), '0123456789' x 26, "correct FS overflow";

$overflow = $file_stream->append( 'Hello World' );
my $lc_stream = new_ok 'Test::Decorator::LowerCasingFilter' => [ name => 'TD-UCF1', component => $file_stream ];
is $lc_stream->output, 'hello world',       "correct LC buffer";
is $lc_stream->buffer_size, 11,             "correct LC buffer size";
