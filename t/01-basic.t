#!/usr/bin/perl
use strict;
use warnings;
use Test::More tests => 4;

use Spreadsheet::Simple;

my $foo = Spreadsheet::Simple->new;
my $sheet = $foo->new_sheet(
	name => 'test',
	rows => [
		[1, 2, 3, 4, 5],
		[6, 7, 8, 9, 10]
	],
);

isa_ok($sheet, 'Spreadsheet::Simple::Sheet');
is($foo->get_sheet(0), $sheet);
is($foo->get_sheet('test'), $sheet);
is($foo->get_sheet('TEST'), $sheet);

