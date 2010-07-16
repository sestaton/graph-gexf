use strict;
use warnings;

use Test::More;

use Graph::GEXF;

ok my $graph = Graph::GEXF->new(), 'graph created';

$graph->add_node_attribute('url', 'anyURI');
$graph->add_node_attribute('lf', 'integer');

is $graph->total_attributes, 2, 'got 2 attributes';

ok my $attr = $graph->get_attribute('url'), 'fetch first attribute';
is $attr->{title}, 'url', 'first attribute is url';

done_testing;
