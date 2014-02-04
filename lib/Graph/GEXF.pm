package Graph::GEXF;

use Moose;
use Data::UUID::LibUUID;
use Moose::Util::TypeConstraints;
use Graph::GEXF::Node;
use namespace::autoclean;

with 'Graph::GEXF::Role::XML',
     'Graph::GEXF::Role::Attributes' => { for => [qw/node edge/], with_method => 1 };

=head1 ATTRIBUTES

=head2 visualization (B<Boolean>)

if set to true, the generated graph will includes visualizations informations

=cut

has visualization => (
    is        => 'ro',
    isa       => 'Bool',
    predicate => 'has_visualization',
);

=head2 graph_mode (B<static|dynamic>)

Is your graph static or dynamic.

=cut

has graph_mode => (
    is       => 'ro',
    isa      => enum( [qw/static dynamic/] ),
    required => 1,
    default  => 'static',
);

=head2 edge_type (B<directed|undirected|mutual|notset>)

The type of the edges

=cut

has edge_type => (
    is       => 'ro',
    isa      => enum( [qw/directed undirected mutual notset/] ),
    required => 1,
    default  => 'directed',
);

=head2 nodes

a HashRef of L<Graph::GEXF::Node> objects.

=cut

has nodes => (
    traits     => ['Hash'],
    is         => 'rw',
    isa        => 'HashRef[Graph::GEXF::Node]',
    default    => sub { {} },
    auto_deref => 1,
    handles    => {
        _node_exists => 'exists',
        _add_node    => 'set',
        total_nodes  => 'count',
        get_node     => 'get',
        all_nodes    => 'keys',
    },
);

=head1 METHODS 

=head2 all_node

Return all the nodes

=cut

sub add_node {
    my $self = shift;
    my ($id, %attributes);

    # TODO should be possible to add a Graph::GEXF::Node too
    
    if ( @_ == 1 ) {
        $id = shift;
    }
    else {
        if ( ( @_ % 2 ) == 0 ) {
            %attributes = @_;
        }
        else {
            $id = shift;
            %attributes = @_;
        }
    }

    if ($id && $self->_node_exists($id)) {
        die "Can't add node wih id $id: already exists";
    }

    $id = new_uuid_string() if !defined $id;

    my $node = Graph::GEXF::Node->new(id => $id);

    map {
        my $attribute = $self->get_node_attribute($_);
        $node->set_node_attribute(
            $_ => {
                id   => $attribute->{id},
                name => $attribute->{name},
                type => $attribute->{type},
            }
        );
    } $self->attributes_node_list;

    $self->_add_node($id => $node);
    $node;
}

=head1 SYNOPSIS

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

=head1 DESCRIPTION

Create or manipulate a graph in GEXF format.
     
=head1 LICENSE
 
The MIT License should included with the project. If not, it can be found at: http://opensource.org/licenses/mit-license.php

=head1 TESTED WITH:

=over

=item *
Perl 5.14.2 (Red Hat Enterprise Linux Desktop release 6.2 (Santiago); Fedora 17)

=back

=head1 AUTHORS

Franck Cuny (http://lumberjaph.net/), S. Evan Staton                                                

=head1 MAINTAINED BY

S. Evan Staton

=head1 CONTACT
 
statonse at gmail dot com

=cut 

__PACKAGE__->meta->make_immutable;

1;
