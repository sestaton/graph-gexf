use strict;
use warnings;
use Test::More;

use Graph::GEXF;

my $graph = Graph::GEXF->new();

my $n1 = $graph->add_node;
$n1->label('hello');

my $n2 = $graph->add_node;
$n2->label('world');

$n1->link_to($n2->id);

ok my $xml = $graph->to_xml;
#print $xml;

done_testing;
