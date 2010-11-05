use strict;
use warnings;
use Test::More;

use Graph::GEXF;

my $graph = Graph::GEXF->new();
$graph->add_node_attribute('url', 'string',);
$graph->add_node_attribute('indegree', 'float', '0.0');
$graph->add_node_attribute('frog', 'boolean', 1);

my $n1 = $graph->add_node(0);
$n1->label('Gephi');
$n1->link_to(1, 2, 3);
$n1->attribute('url' => 'http://gephi.org/');

my $n2 = $graph->add_node(1);
$n2->label('WebAtlas');
$n2->link_to(0);
$n2->attribute('url' => 'http://webatlas.fr/');

my $n3 = $graph->add_node(2);
$n3->label('RTGI');
$n3->link_to(1);

my $n4 = $graph->add_node(3);
$n4->label('BarabasiLab');

ok my $xml = $graph->to_xml;

print $xml;

done_testing;
