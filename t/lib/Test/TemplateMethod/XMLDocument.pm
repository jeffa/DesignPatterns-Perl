package Test::TemplateMethod::XMLDocument;
use Moose;
use Carp;
our $VERSION = '0.01';

use XML::Simple;

extends 'Test::TemplateMethod::Document';

sub do_read { $_[0]->set_content( XMLin do { local $/; $_[0]->get_fh->getline } ) }

1;
