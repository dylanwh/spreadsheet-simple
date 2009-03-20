#!/usr/bin/perl
use strict;
use warnings;
use Test::More tests => 5;

use Spreadsheet::Simple;

my $foo = Spreadsheet::Simple->new;
my $sheet = $foo->new_sheet(
	name => 'test',
	rows => [
	    # A  B  C  D  E
		[ 1, 2, 3, 4, 5], # 1 
		[ 6, 7, 8, 9, 10] # 2
	],
);

isa_ok($sheet, 'Spreadsheet::Simple::Sheet');
is($foo->get_sheet(0), $sheet, 'get_sheet(0)');
is($foo->find_sheet(0), $sheet, 'find_sheet(0)');
is($foo->find_sheet('test'), $sheet, 'find_sheet("test")');
is($foo->find_sheet('TEST'), $sheet, 'find_sheet("TEST")');

#is($sheet->get('A1'), '1', 'get("A1")');
#is($sheet->get('A1'), '10', 'get("E2")');

sub frob {
	local $_ = shift;
	return [ map { Spreadsheet::Simple::Row->new(cells => $_ ) } @$_ ];
}

sub gork {
	local $_ = shift;
	return [ map { Spreadsheet::Simple::Cell->new(data => $_) } @$_ ];
}

