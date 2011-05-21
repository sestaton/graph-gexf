use strict;
use warnings;

use Test::More;
use Test::Exception;

use Graph::GEXF;

my $graph = Graph::GEXF->new(visualization => 1);

my $n = $graph->add_node();

# position
_test($n, 1, qw/x y z/);
_test($n, 1, qw/r g b/);

# colors
dies_ok {$n->r(256)} "can't set color to value > 255";
dies_ok {$n->r(-1)} "can't set color to value < 0";

my $xml = $graph->to_xml;

warn $xml;

sub _test{
    my ($n, $value, @attr) = @_;
    foreach (@attr){
        $n->$_($value);
    }
    foreach (@attr){
        is $n->$_, $value, "property $_ is set to $value";
    }
}

done_testing;
