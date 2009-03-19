#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'Spreadsheet::Simple' );
}

diag( "Testing Spreadsheet::Simple $Spreadsheet::Simple::VERSION, Perl $], $^X" );
