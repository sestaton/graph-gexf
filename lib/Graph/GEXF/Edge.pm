package Graph::GEXF::Edge;

use Moose;
use Data::UUID::LibUUID;

has id => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
    default  => sub { new_uuid_string() }
);

has source => (is => 'ro', isa => 'Str', required => 1);
has target => (is => 'ro', isa => 'Str', required => 1);
has label  => (is => 'rw', isa => 'Str');
has weight => (is => 'rw', isa => 'Num', lazy => 1, default => 1);

1;
