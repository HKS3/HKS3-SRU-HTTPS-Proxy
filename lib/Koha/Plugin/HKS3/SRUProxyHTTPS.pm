package Koha::Plugin::HKS3::SRUProxyHTTPS;

use Modern::Perl;

use base qw(Koha::Plugins::Base);

use Mojo::JSON qw(decode_json);

our $VERSION = "0.900";

our $metadata = {
    name            => 'SRU Proxy HTTPS',
    author          => 'Thomas Klausner, HKS3',
    date_authored   => '2022-03-25',
    date_updated    => '2022-03-25',
    minimum_version => '19.05.00.000',
    maximum_version => undef,
    version         => $VERSION,
    description     => 'Proxy SRU requests to HTTPS endpoints'
};

sub new {
    my ( $class, $args ) = @_;

    $args->{'metadata'} = $metadata;
    $args->{'metadata'}->{'class'} = $class;

    my $self = $class->SUPER::new($args);
    return $self;
}

sub api_routes {
    my ( $self, $args ) = @_;

    my $spec_str = $self->mbf_read('openapi.json');
    my $spec     = decode_json($spec_str);

    return $spec;
}

sub api_namespace {
    my ( $self ) = @_;

    return 'sru-proxy-https';
}

q{ listening to: Elektro Guzzi - Triangle };
