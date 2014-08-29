package Test::TemplateMethod::TextDocument;
use Moose;
use Carp;
our $VERSION = '0.01';

use FreezeThaw qw( thaw );

extends 'Test::TemplateMethod::Document';

sub do_read { $_[0]->set_content( thaw do { local $/; $_[0]->get_fh->getline } ) }


1;
