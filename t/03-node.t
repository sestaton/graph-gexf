use strict;
use warnings;
use Test::More;

use Graph::GEXF::Node;

ok my $node = Graph::GEXF::Node->new(id =>0), 'node created';

ok !$node->attribute('url', 'http://linkfluence.net'), 'can\'t add attribute, not attributes defined';

ok $node = Graph::GEXF::Node->new(
    id         => 0,
    attributes => {url => {title => 'url', type => 'anyURI'}}
  ),
  'node created';

ok $node->attribute('url', 'http://linkfluence.net'), 'add attribute url to node';

done_testing;
