#!/usr/bin/perl
use strict;
use warnings;

use Test::More tests => 7;
use Test::Exception;

BEGIN { use_ok "Spreadsheet::Simple::Cell" }

my $cell;
lives_ok {
	$cell = new Spreadsheet::Simple::Cell (
		value => 'foo'
	);
} 'construct cell';

ok($cell, 'constructed cell');

is($cell->value, 'foo');

dies_ok {
	$cell->value({});
} 'cells cannot contain hashrefs';

lives_ok {
	$cell->value('bar');
} 'cells can contain strings';

my $cell2 = new Spreadsheet::Simple::Cell (
	value => 'bar',
	color => [0xff, 0xff, 0xff],
);

is_deeply($cell2->color, [255, 255, 255], 'check rgb value');

