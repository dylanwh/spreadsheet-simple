package Spreadsheet::Simple::Reader::Excel;
use Moose;

our $VERSION = '0.01';
our $AUTHORITY = 'cpan:DHARDISON';

use Spreadsheet::ParseExcel;

use Spreadsheet::Simple::Document;
use Spreadsheet::Simple::Sheet;
use Spreadsheet::Simple::Row;
use Spreadsheet::Simple::Cell;

use namespace::clean -except => 'meta';

with 'Spreadsheet::Simple::Role::Reader';

sub read_file {
	my ($self, $file) = @_;
	my $wb = Spreadsheet::ParseExcel::Workbook->Parse($file);

	return $self->_map_document($wb);
}

sub _map_document {
	my ($self, $wb) = @_;
	
	return Spreadsheet::Simple::Document->new(
		sheets => [
			map { $self->_map_sheet($_) } @{ $wb->{Worksheet} }
		],
	);
}

sub _map_sheet {
	my ($self, $ws) = @_;

	return Spreadsheet::Simple::Sheet->new(
		name => $ws->{Name},
		rows => [
			map { $self->_map_row($_) } @{ $ws->{Cells} }
		],
	);

}

sub _map_row {
	my ($self, $row) = @_;

	return Spreadsheet::Simple::Row->new(
		cells => [
			map { $self->_map_cell($_) } @{ $row }
		],
	);
}

sub _map_cell {
	my ($self, $cell) = @_;

	return Spreadsheet::Simple::Cell->new(
		value => eval { $cell->value },
	);
}

1;
