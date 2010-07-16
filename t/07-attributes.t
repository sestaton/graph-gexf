use strict;
use warnings;
use Test::More;

use Graph::GEXF;

my $graph = Graph::GEXF->new();
ok $graph->add_node_attribute('foo','bar','baz');
ok $graph->add_edge_attribute('baz', 'bar', 'foo');

print $graph->to_xml;

done_testing;
