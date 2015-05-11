#!perl -T
use strict;
use warnings FATAL => 'all';
use Test::More;
use Capture::Tiny 'capture';

plan tests => 14;

use lib 't/lib';
use_ok 'Test::Proxy::Graphic';
use_ok 'Test::Proxy::Image';
use_ok 'Test::Proxy::Proxy';

my $proxy = new_ok 'Test::Proxy::Proxy' => [
    filename => 'foo.jpg',
    width    => 500,
    height   => 500,
];

is $proxy->get_filename, 'foo.jpg',         "correct filename";
is $proxy->get_width, 500,                  "correct width";
is $proxy->get_height, 500,                 "correct height";
is_deeply $proxy->get_extent, [500,500],    "correct extent";
is $proxy->get_image, undef,                "image not yet loaded";

my ($stdout) = capture { $proxy->draw }; 
is $stdout, "loading 'foo.jpg'\n500x500\n", "correct STDOUT";

my $image = $proxy->get_image;
isa_ok $image, 'Test::Proxy::Image';
is $image->get_filename, 'foo.jpg',         "correct filename";
is $image->get_width, 500,                  "correct width";
is $image->get_height, 500,                 "correct height";
