#!perl -T
use strict;
use warnings FATAL => 'all';
use Test::More;
use Test::Exception;

plan tests => 12;

use lib 't/lib';
use_ok $_ for qw(
    Test::Strategy::Document
    Test::Strategy::List
    Test::Strategy::Ordered
    Test::Strategy::Table
    Test::Strategy::Unordered
);

my $ol  = new_ok( 'Test::Strategy::Ordered' );
my $ul  = new_ok( 'Test::Strategy::Unordered' );
my $tbl = new_ok( 'Test::Strategy::Table' );

my @data = qw( foo bar baz qux );

my $doc = new_ok( 'Test::Strategy::Document' => [ strategy => $ol, data => \@data ] );

is $doc->context, '<ol><li>foo</li><li>bar</li><li>baz</li><li>qux</li></ol>', "correct output for ordered list";

$doc->set_strategy( $ul );
is $doc->context, '<ul><li>foo</li><li>bar</li><li>baz</li><li>qux</li></ul>', "correct output for unordered list";

$doc->set_strategy( $tbl );
is $doc->context, '<table><tr><td>foo</td><td>bar</td><td>baz</td><td>qux</td></tr></table>', "correct output for table list";
