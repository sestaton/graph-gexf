use strict;
use warnings;
use Module::Build;

my %build_args = (
    'module_name'          => 'Graph::GEXF',
    'dist_name'            => 'graph-gexf',
    'license'              => 'mit',
    'configure_requires'   => { 'Module::Build'                => 0, },
    'requires'             => { 'Moose'                        => 2.0802, 
				'MooseX::Role::Parameterized'  => 1.02,
				'MooseX::Attribute::Chained'   => 1.0.1,
				'XML::Simple'                  => 2.20,
				'namespace::autoclean'         => 0.14,
				'Data::UUID::LibUUID'          => 0.05,
    },
    'dist_version'         => 0.01,
    'dist_abstract'        => "Generate graph in GEXF format",
    'dist_author'          => "S. Evan Staton <statonse\@gmail.com>",
    'recursive_test_files' => 1,
);

my $mb = Module::Build->new(%build_args);
$mb->create_build_script;
