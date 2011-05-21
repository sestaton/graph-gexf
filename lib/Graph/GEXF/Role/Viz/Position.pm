package Graph::GEXF::Role::Viz::Position;

use Moose::Role;

has [qw/x y z/] => (
    is  => 'rw',
    isa => 'Num',
);

no Moose::Role;

1;
