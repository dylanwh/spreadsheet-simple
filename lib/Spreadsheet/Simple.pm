package Spreadsheet::Simple;
use Moose;

our $VERSION = '0.01';
our $AUTHORITY = 'cpan:DHARDISON';

use MooseX::Types::Path::Class;

has 'filename' => (
    is       => 'ro',
    isa      => 'Path::Class::File',
    required => 1,
    coerce   => 1,
);

has 'sheets' => (
    is         => 'ro',
    isa        => 'ArrayRef[Spreadsheet::Simple::Sheet]',
    lazy_build => 1,
);

1; # End of Spreadsheet::Simple

=head1 NAME

Spreadsheet::Simple - The great new Spreadsheet::Simple!

=head1 VERSION

Version 0.01

=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use Spreadsheet::Simple;

    my $s = Spreadsheet::Simple->new(filename => "foo.xls");


=head1 BUGS

Please report any bugs or feature requests to C<bug-spreadsheet-simple at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Spreadsheet-Simple>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 AUTHOR

Dylan William Hardison, C<< <dylan at hardison.net> >>

=head1 COPYRIGHT

Copyright 2009 Dylan William Hardison, Infinity Interactive. All rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.
