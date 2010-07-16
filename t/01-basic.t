use strict;
use warnings;
use Test::More;
use Graph::GEXF;

ok my $graph = Graph::GEXF->new(), 'graph created';
ok my $n1 = $graph->add_node(), 'node created';
ok $n1->id, 'node has an id';
is $graph->total_nodes, 1, 'got one node';
ok my $n2 = $graph->get_node($n1->id);

done_testing;
