package Graph::GEXF::Role::Viz::Color;

use Moose::Role;
use Moose::Util::TypeConstraints;

subtype RGBColor => as 'Int' => where { $_ >= 0 && $_ <= 255 };

has [qw/r g b/] => (
    is  => 'rw',
    isa => 'RGBColor',
);

no Moose::Util::TypeConstraints;
no Moose::Role;

1;
