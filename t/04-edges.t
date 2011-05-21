use strict;
use warnings;

use Test::More;

use Graph::GEXF;

my $graph = Graph::GEXF->new();

my $n1 = $graph->add_node();
my $n2 = $graph->add_node();

$n1->link_to($n2->id);

ok $n1->has_link_to($n2->id);

done_testing;
