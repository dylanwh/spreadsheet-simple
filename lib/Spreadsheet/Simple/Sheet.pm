package Spreadsheet::Simple::Sheet;
use Moose;
use MooseX::AttributeHelpers;

our $VERSION = '0.01';
our $AUTHORITY = 'cpan:DHARDISON';

use MooseX::Types::Moose 'Str';

use Spreadsheet::Simple::Types 'Rows';
use Spreadsheet::Simple::Row;

use namespace::clean -except => 'meta';

has 'name' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

has 'rows' => (
	metaclass => 'Collection::Array',
    is         => 'ro',
    isa        => Rows,
    coerce     => 1,
    auto_deref => 1,
    required   => 1,
    provides   => {
    	'push' => 'add_row',
    	'get'  => 'get_row',
    	'set'  => 'set_row',
    },
);

around 'get_row' => sub {
	my ($method, $self, $idx) = @_;
	my $row = $self->$method($idx);
	
	return $row if defined $row;

	$row = Spreadsheet::Simple::Row->new(cells => []);
	$self->set_row($idx, $row);

	return $row;
};


sub new_row {
	my ($self, @args) = @_;
	my $row = Spreadsheet::Simple::Row->new(@args);

	return $row;
}

sub get_cell {
	my ($self, $row, $col) = @_;
	return $self->get_row($row)->get_cell($col);
}

sub set_cell {
	my ($self, $row, $col, $cell) = @_;
	$self->get_row($row)->set_cell($col, $cell);
}

sub get_cell_value {
	my ($self, $row, $col) = @_;

	return $self->get_cell($row, $col)->value;
}

sub set_cell_value {
	my ($self, $row, $col, $val) = @_;

	return $self->set_cell(
		$row, 
		$col, 
		Spreadsheet::Simple::Cell->new(
			value => $val,
		)
	);
}

sub _format_column_ref {
	my ($self, $col) = @_;
	my @buffer;

	while ($col > 25) {
		push @buffer, chr(($col % 26) + ord('A'));
		$col = ($col / 26) - 1;
	}
	push @buffer, chr($col + ord('A'));

	return reverse join('', @buffer);
}

sub _parse_column_ref {
	my ($self, $col) = @_;
	my $sum = 0;

	foreach my $char (split(//, uc $col)) {
		$sum = 26 * $sum + 1 + ord ($char) - ord ('A');
	}

	return $sum - 1;
}



1;
