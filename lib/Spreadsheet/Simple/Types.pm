package Spreadsheet::Simple::Types;
use strict;
use warnings;

our $VERSION = '0.01';
our $AUTHORITY = 'cpan:DHARDISON';

use MooseX::Types -declare => [qw( Cells Rows Sheets )];
use MooseX::Types::Moose 'HashRef', 'ArrayRef', 'Str';

class_type 'Spreadsheet::Simple::Cell';
class_type 'Spreadsheet::Simple::Row';
class_type 'Spreadsheet::Simple::Sheet';

subtype Cells,  as ArrayRef['Spreadsheet::Simple::Cell'];
subtype Rows,   as ArrayRef['Spreadsheet::Simple::Row'];
subtype Sheets, as ArrayRef['Spreadsheet::Simple::Sheet'];

coerce Cells,
	from ArrayRef[Str],
	via { 
		Class::MOP::load_class('Spreadsheet::Simple::Cell');
		return [ 
			map {
				Spreadsheet::Simple::Cell->new(value => $_) 
			} @$_ 
		] 
	};

coerce Rows,
	from ArrayRef[ArrayRef[Str]],
	via {
		Class::MOP::load_class('Spreadsheet::Simple::Row');
		return [
			map {
				Spreadsheet::Simple::Row->new( cells => to_Cells($_) )
			} @$_
		]
	};

coerce Sheets,
	from HashRef[ArrayRef[ArrayRef[Str]]],
	via {
		Class::MOP::load_class('Spreadsheet::Simple::Sheet');
		my @result;

		foreach my $k (keys %$_) {
			push @result, Spreadsheet::Simple::Sheet->new(
				name => $k,
				rows => to_Rows($_->{$k}),
			);
		}

		return \@result;
	};

1;
