use strict;
use warnings;
use Test::More;
use Test::Exception;
use Graph::GEXF::Node;

ok my $node = Graph::GEXF::Node->new(id => 0), 'node created';

dies_ok { $node->attribute('url', 'http://linkfluence.net') }
'can\'t add attribute, no attributes defined';

ok $node = Graph::GEXF::Node->new(id => 0,), 'node created';
ok $node->set_node_attribute(
    url => {id => 0, name => 'url', type => 'anyURL'}), 'attribute added';

ok $node->attribute('url', 'http://linkfluence.net'),
  'add attribute url to node';

done_testing;
