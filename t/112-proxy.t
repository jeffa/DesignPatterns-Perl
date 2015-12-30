#!perl -T
use strict;
use warnings FATAL => 'all';
use Test::More;
use Capture::Tiny 'capture';

plan tests => 29;

use lib 't/lib';
use_ok $_ for qw(
    Test::Proxy::Graphic
    Test::Proxy::Proxy
    Test::Proxy::Image
    Test::Proxy::WebImage
    Test::Proxy::RandImage
);

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

# Web Image
my $url = 'http://137.189.35.203/WebUI/CatDatabase/annotation.png';
$proxy = new_ok 'Test::Proxy::Proxy' => [ filename => $url ];
is $proxy->get_filename, $url,                  "correct filename";
is $proxy->get_width, undef,                    "correct width";
is $proxy->get_height, undef,                   "correct height";
is_deeply $proxy->get_extent, [undef,undef],    "correct extent";
is $proxy->get_image, undef,                    "image not yet loaded";

# this test actually makes a web call, we don't always need to do this
#($stdout) = capture { $proxy->draw }; 
#isa_ok $proxy->get_image, 'Test::Proxy::WebImage';

# Rand Image
$proxy = new_ok 'Test::Proxy::Proxy'=> [ width => 40, height => 55 ];
is $proxy->get_filename, undef,                 "correct filename";
is $proxy->get_width, 40,                       "correct width";
is $proxy->get_height, 55,                      "correct height";
is_deeply $proxy->get_extent, [40,55],          "correct extent";
is $proxy->get_image, undef,                    "image not yet loaded";

($stdout) = capture { $proxy->draw }; 
isa_ok $proxy->get_image, 'Test::Proxy::RandImage';

