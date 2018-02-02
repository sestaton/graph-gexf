Graph::GEXF
===========

Create or manipulate a graph in GEXF format

**SYNOPSIS**

```perl
# create a new graph
 my $graph = Graph::GEXF->new();
 # add some attributes for nodes
 $graph->add_node_attribute('url', 'string');
 # create a new node and set the label
 my $n1 = $graph->add_node(0);
 $n1->label('Gephi');
 my $n2 = $graph->add_node(1);
 $n2->label('WebAtlas');
 my $n3 = $graph->add_node(2);
 $n3->label('RTGI');
 # create relations between nodes
 $n1->link_to(1, 2);
 $n2->link_to(0);
 $n3->link_to(1);
 # set the value for attributes
 $n1->attribute('url' => 'http://gephi.org/');
 $n2->attribute('url' => 'http://webatlas.fr/');
 $n3->attribute('url' => 'http://rtgi.fr/');
 # render the graph in XML
 my $xml = $graph->to_xml;
```

**AUTHORS**

Franck Cuny (http://lumberjaph.net/), S. Evan Staton                                                

**MAINTAINED BY**

S. Evan Staton

**CONTACT**

evan at evanstaton.com

**LICENSE**

The MIT License should included with the project. If not, it can be found at: http://opensource.org/licenses/mit-license.php