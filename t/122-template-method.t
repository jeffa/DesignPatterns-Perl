#!perl -T
use strict;
use warnings FATAL => 'all';
use Test::More;
plan tests => 9;

use JSON;
use XML::Simple;
use FreezeThaw qw( freeze );
use File::Temp qw( tempfile );

use lib 't/lib';
use_ok $_ for qw(
    Test::TemplateMethod::Application
    Test::TemplateMethod::Document
    Test::TemplateMethod::JSONDocument
    Test::TemplateMethod::TextDocument
    Test::TemplateMethod::XMLDocument
);

my $data = { qw( foo bar baz qux ) };
my $app  = new_ok 'Test::TemplateMethod::Application';

my ($fh, $fname) = tempfile( UNLINK => 1, SUFFIX => '.txt' );
print $fh freeze $data;
close $fh;
$app->open_document( $fname );

($fh, $fname) = tempfile( UNLINK => 1, SUFFIX => '.json' );
print $fh encode_json $data;
close $fh;
$app->open_document( $fname );

($fh, $fname) = tempfile( UNLINK => 1, SUFFIX => '.xml' );
print $fh XMLout $data;
close $fh;
$app->open_document( $fname );

for (@{ $app->get_documents }) {
    my ($file,$doc_data) = each %$_;
    is_deeply $doc_data, $data, "$file data is correct";
}
