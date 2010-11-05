package Graph::GEXF::Node;

use Moose;

use Graph::GEXF::Edge;
with 'Graph::GEXF::Role::Position',
  'Graph::GEXF::Role::Attributes' => { for => [qw/node/] };

has id => (is => 'ro', isa => 'Str', required => 1);
has label => (is => 'rw', isa => 'Str');

has edges => (
    traits  => ['Hash'],
    is      => 'rw',
    isa     => 'HashRef[Graph::GEXF::Edge]',
    default => sub { {} },
    handles => {
        add_edge    => 'set',
        has_link_to => 'exists',
        all_edges   => 'keys',
        get_edge    => 'get',
    }
);

sub link_to {
    my $self     = shift;
    my @nodes_id = @_;

    foreach my $node_id (@nodes_id) {
        my $edge =
          Graph::GEXF::Edge->new(source => $self->id, target => $node_id);

        $self->add_edge($node_id => $edge);
    }
}

sub attribute {
    my ($self, $attribute_name, $value) = @_;

#    return 0 unless $self->has_node_attribute;

    if (!$self->has_node_attribute($attribute_name)) {
        die "this attribute doesn't exists";
    }

    $self->node_attributes->{$attribute_name}->{value} = $value;

    1;
}

1;
