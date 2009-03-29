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

has 'parser' => (
    is         => 'ro',
    lazy_build => 1,
    handles    => {
        'parse'        => 'Parse',
        'color_to_rgb' => 'ColorIdxToRGB',
    },
);

sub _build_parser { Spreadsheet::ParseExcel->new }

sub read_file {
	my ($self, $file) = @_;
	my $wb = $self->parse($file);

	return $self->map_document($wb);
}

sub map_document {
	my ($self, $wb) = @_;
	
	return Spreadsheet::Simple::Document->new(
		sheets => [
			map { $self->map_sheet($_) } @{ $wb->{Worksheet} }
		],
	);
}

sub map_sheet {
	my ($self, $ws) = @_;

	return Spreadsheet::Simple::Sheet->new(
		name => $ws->{Name},
		rows => [
			map { $self->map_row($_) } @{ $ws->{Cells} }
		],
	);

}

sub map_row {
	my ($self, $row) = @_;

	return Spreadsheet::Simple::Row->new(
		cells => [
			map { $self->map_cell($_) } @{ $row }
		],
	);
}

sub map_cell {
	my ($self, $cell) = @_;

	return Spreadsheet::Simple::Cell->new(
		value => eval { $cell->value } || undef,
		color => [
			map { hex } unpack("A2A2A2",
				$self->color_to_rgb($cell->{Format}{Font}{Color})
			)
		],
	);
}

1;
