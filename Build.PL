use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Spreadsheet::Simple',
    license             => 'perl',
    dist_author         => 'Dylan William Hardison <dylan@hardison.net>',
    dist_version_from   => 'lib/Spreadsheet/Simple.pm',
    build_requires => {
        'Test::More' => 0,
        'Spreadsheet::ParseExcel' => '0.49',
        'MooseX::Types'           => '0.08',
        'MooseX::AttributeHelpers' => '0.14',
    },
    add_to_cleanup      => [ 'Spreadsheet-Simple-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
