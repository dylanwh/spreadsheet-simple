#!/usr/bin/perl
use strict;
use warnings;
use Test::More tests => 8;

use Spreadsheet::Simple::Document;

my $doc = Spreadsheet::Simple::Document->new;
my $sheet = $doc->new_sheet(
	name => 'test',
	rows => [
	    # 0  1  2  3  4
		[ 1, 2, 3, 4, 5], # 0 
		[ 6, 7, 8, 9, 10] # 1 
	],
);

isa_ok($sheet, 'Spreadsheet::Simple::Sheet');
is($doc->get_sheet(0), $sheet, 'get_sheet(0)');
is($doc->get_sheet_by_name('test'), $sheet, 'get_sheet_by_name("test")');
is($doc->get_sheet_by_name('TEST'), $sheet, 'get_sheet_by_name("TEST")');

is($sheet->get_cell(0, 0)->value, '1', 'get_cell(0, 0)');
is($sheet->get_cell(1, 4)->value, '10', 'get_cell(1, 4)');
is($sheet->get_cell(5, 5)->value, undef, 'get_cell(5, 5)');

$sheet->get_cell(10, 10)->value('pants');
is($sheet->get_cell(10, 10)->value, 'pants', 'get_cell(10, 10)');

sub frob {
	local $_ = shift;
	return [ map { Spreadsheet::Simple::Row->new(cells => $_ ) } @$_ ];
}

sub gork {
	local $_ = shift;
	return [ map { Spreadsheet::Simple::Cell->new(value => $_) } @$_ ];
}

