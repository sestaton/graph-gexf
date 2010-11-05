package Graph::GEXF::Role::Position;

use Moose::Role;

for (qw/x y z/) {
    has $_ => (
        is      => 'rw',
        isa     => 'Num',
        lazy    => 1,
        default => '0.0',
    );
}

1;
