#!/usr/bin/perl
use strict;
use warnings;
use Test::More tests => 3;
use Test::Exception;

use Spreadsheet::Simple::Row;

lives_ok {
    my $row = Spreadsheet::Simple::Row->new( cells => [ "foo", "bar", "baz" ] );
};

my $row = Spreadsheet::Simple::Row->new( cells => [ 1 .. 20 ] );

is_deeply(
	[ 1, 2, 3],
	[ $row->get_cell_values(0, 1, 2) ],
	"get_cell_values"
);

is_deeply(
	[ 1 .. 20 ],
	[ $row->cell_values ],
	'cell_values'
);

