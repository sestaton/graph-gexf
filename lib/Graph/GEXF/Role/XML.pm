package Graph::GEXF::Role::XML;

use Moose::Role;

use XML::Simple;

has gexf_ns =>
  (is => 'ro', isa => 'Str', default => 'http://www.gexf.net/1.1draft');

has gexf_version => (is => 'ro', isa => 'Num', default => '1.1');

sub to_xml {
    my $self = shift;

    my $graph = {
        gexf => {
            xmlns   => $self->gexf_ns,
            version => $self->gexf_version,
            meta    => {creator => ['Graph::GEXF']},
            graph   => {
                mode            => $self->graph_mode,
                defaultedgetype => $self->edge_type,
            }
        }
    };

    foreach my $attr_id ($self->attributes_node_list) {
        my $attribute = $self->get_node_attribute($attr_id);
        $graph->{gexf}->{graph}->{attributes}->{class} = 'node';
        push @{$graph->{gexf}->{graph}->{attributes}->{attribute}},
          { id    => $attribute->{id},
            type  => $attribute->{type},
            title => $attribute->{title},
          };
    }

    my $edges_id = 0;

    foreach my $node_id ($self->all_nodes) {
        my $node = $self->get_node($node_id);
        my $node_desc = {
            id => $node->id,
            label => $node->label,
        };

        foreach my $attr_id ($node->attributes_node_list) {
            my $attr = $node->get_node_attribute($attr_id);
            push @{$node_desc->{attvalues}->{attvalue}}, {for => $attr->{id}, value => $attr->{value}};
        }

        push @{$graph->{gexf}->{graph}->{nodes}->{node}}, $node_desc;

        foreach my $edge_id ($node->all_edges) {
            my $edge = $node->get_edge($edge_id);
            push @{$graph->{gexf}->{graph}->{edges}->{edge}},
              { id     => $edges_id,
                source => $edge->source,
                target => $edge->target
              };
        }
    }

    my $xml_out = XMLout($graph, AttrIndent => 1, keepRoot => 1);
    $xml_out;
}

1;
