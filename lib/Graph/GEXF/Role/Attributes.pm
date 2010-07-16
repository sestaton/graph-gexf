package Graph::GEXF::Role::Attributes;

use MooseX::Role::Parameterized;

parameter for => (
    is       => 'ro',
    required => 1,
);

role {
    my $p = shift;

    foreach my $type (@{$p->for}) {

        my $attr_name = $type . '_attributes';

        has $attr_name => (
            traits  => ['Hash'],
            is      => 'rw',
            isa     => 'HashRef',
            lazy    => 1,
            default => sub { {} },
            handles => {
                'attributes_' . $type . '_total' => 'count',
                'set_' . $type . '_attribute'    => 'set',
                'get_' . $type . '_attribute'    => 'get',
                'attributes_' . $type . '_list'  => 'keys',
                'has_'.$type.'_attribute' => 'exists',
            }
        );
    }

};

1;
