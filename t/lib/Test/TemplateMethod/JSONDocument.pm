package Test::TemplateMethod::JSONDocument;
use Moose;
use Carp;
our $VERSION = '0.01';

use JSON;

extends 'Test::TemplateMethod::Document';

sub do_read { $_[0]->set_content( decode_json do { local $/; $_[0]->get_fh->getline } ) }


1;
